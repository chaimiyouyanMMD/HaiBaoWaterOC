//
//  WDUserInfoController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/29.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define WDUserInfoControllerCellKey @"WDUserInfoController"

#import "WDUserInfoController.h"
#import "WDUserIconView.h"
#import "WDEditNameController.h"
#import "WDAddressController.h"
#import "WDMineCell.h"
#import "WDHttpRequestTool.h"
#import "WDUserInfo.h"
#import "WDUserTool.h"
#import "WDBaseModel.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"
//#import "AFHTTPClient.h"
@interface WDUserInfoController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic,strong)NSArray *allData;
@property(nonatomic,weak)WDUserIconView *headView ;
@property(nonatomic,strong)WDUserInfo *userModel;
@property(nonatomic,weak)UITableView *tableView;
@end

@implementation WDUserInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]init];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(0);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WDMineCell class] forCellReuseIdentifier:WDUserInfoControllerCellKey];
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self requestUserInfo];

    
    
    
}
#pragma mark - 请求个人信息
-(void)requestUserInfo
{

    WDUserInfo *user = [WDUserTool currentUser];
    NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@&%@",[WDHttpRequestTool appSecret],user.access_token_secret]];
    
    NSDictionary *accessInfo = @{
                            @"app_key":[WDHttpRequestTool appKey],
                            @"signature":signature,
                            @"access_token":user.access_token,
                            @"phone_num":user.phone_num
                            };
    NSDictionary *param = @{
                            @"sign":@"sign",
                            @"accessInfo":accessInfo
                            };
    [WDHttpRequestTool requestWithUrl:@"userInfo/info" params:param successBlock:^(id json) {
        WDUserInfo *userModel = [WDUserInfo mj_objectWithKeyValues:json[@"userInfo"]];
        self.userModel = userModel;
        [self loadData];
        [self settingHeadView];

        [self.tableView reloadData];
    }];
    
    
}
- (void)loadData {
    NSString *userName = self.userModel.name;
    if (userName == nil || userName.length == 0) {
        userName = @"请填写您的姓名";
    }
    NSString *haiBaoId = [NSString stringWithFormat:@"%d",self.userModel.haibaoId];
    
    WDCellModel *name = [[WDCellModel alloc]initWithIcon:nil title:@"海豹队员的名字" subTitle:userName descVc:[WDEditNameController class] accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    name.clickBlock = ^(){
        WDEditNameController *desc = [[WDEditNameController alloc]init];
        desc.title = @"修改名字";
        desc.saveNameBlock = ^(NSString *name){
            WDUserInfo *user = [WDUserTool currentUser];
            NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@&%@",[WDHttpRequestTool appSecret],user.access_token_secret]];
            NSDictionary *accessInfo = @{
                                         @"app_key":[WDHttpRequestTool appKey],
                                         @"signature":signature,
                                         @"access_token":user.access_token,
                                         @"phone_num":user.phone_num
                                         };
            NSDictionary *userInfo = @{
                                       @"name":name
                                       };
            NSDictionary *param = @{
                                    @"accessInfo":accessInfo,
                                    @"userInfo":userInfo,
                                    @"sign":@"sign"
                                    };
            [WDHttpRequestTool requestWithUrl:@"userInfo/save" params:param successBlock:^(id json) {
                [SVProgressHUD showSuccessWithStatus:@"修改成功!"];
                [self requestUserInfo];
            }];
            
        };
        [self.navigationController pushViewController:desc animated:YES];
    };
    WDCellModel *no = [[WDCellModel alloc]initWithIcon:nil title:@"海豹队员的编号" subTitle:haiBaoId descVc:nil accessoryType:UITableViewCellAccessoryNone];
    WDCellModel *addr = [[WDCellModel alloc]initWithIcon:nil title:@"送货地址" subTitle:@"" descVc:[WDAddressController class] accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.allData = @[@[name,no],@[addr]];
}
-(void)settingHeadView{
    // 头部
    WDUserIconView *headView = [[WDUserIconView alloc]init];
    headView.frame = CGRectMake(0, 0,SCREEN_WIDTH , 80);
    [headView.iconView addTarget:self action:@selector(chooseIcon) forControlEvents:UIControlEventTouchUpInside];
    self.headView = headView;
    self.tableView.tableHeaderView = headView;
}
#pragma mark - 选择头像
-(void)chooseIcon
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册中选取", nil];
    [sheet showInView:self.view];
}
#pragma mark - UIActionSheet代理方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagePic = [[UIImagePickerController alloc]init];
    switch (buttonIndex) {
        case 0:
            // 从相册中选取
            imagePic.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
        case 1:
            // 拍照
            imagePic.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
        default:
            return;
            break;
    }
    imagePic.delegate = self;
    imagePic.allowsEditing = YES;
    [self presentViewController:imagePic animated:YES completion:^{}];
}
#pragma mark - UIImagePickerController代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [self.headView.iconView setImage:image forState:UIControlStateNormal];
        NSString *j = [NSString stringWithFormat:@"%d",arc4random()%100];
        NSString *mystring = [NSString stringWithFormat:@"%@",[@"usesupload" stringByAppendingString:j]];
        NSString *mystring1 = [NSString stringWithFormat:@"%@",[mystring stringByAppendingString:@".jpg"]];
        NSDictionary *params  = [NSDictionary dictionary];
        //  代码来源：http://www.cnblogs.com/worldtraveler/p/4736501.html
        
        NSString *url = [WDHttpRequestTool getRequestUrl:@"userInfo/uploadPhoto"];
        
//        NSURLRequest *request = []

//       
//        NSData *imageData =  UIImageJPEGRepresentation(image, .1);
//
//        AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"", nil]
//        NSDictionary *param = @{
//                                @"file":imageData
//                                };
//        
//        [mgr POST:url parameters:parma constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//            [formData appendPartWithFileData:imageData name:@"file" fileName:mystring1 mimeType:@"jpg"];
//        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"%@,===%@",error,request.mainDocumentURL.URLByStandardizingPath);
//
//        }];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *items = self.allData[section];
    return items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *items = self.allData[indexPath.section];
    WDCellModel *model = items[indexPath.row];
    WDMineCell *cell = [tableView dequeueReusableCellWithIdentifier:WDUserInfoControllerCellKey];
    cell.cellM = model;
    cell.accessoryType = model.accessoryType;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *items = self.allData[indexPath.section];
    WDCellModel *model = items[indexPath.row];
    if (model.clickBlock) {
        model.clickBlock();
        return;
    }
    UIViewController *descVc = [[model.descVc alloc]init];
    descVc.title = model.title;
    [self.navigationController pushViewController:descVc animated:YES];
}

@end
