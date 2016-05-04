//
//  WDAddressController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define AddressCellKey @"WDAddressController"
#import "WDAddressController.h"
#import "WDHttpRequestTool.h"
#import "WDSingleton.h"
#import <MAMapKit/MAMapKit.h>
#import "WDAddressModel.h"
#import "MJExtension.h"
#import "WDAddressCell.h"
#import "WDCreatAddrController.h"

@interface WDAddressController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *allData;
@end

@implementation WDAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WDAddressCell class] forCellReuseIdentifier:AddressCellKey];
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self requestAddr];
    [self settingNav];
}
#pragma mark - 设置navItem
-(void)settingNav
{
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(0, 0, 60, 32);
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [rightBtn addTarget:self action:@selector(createAddr) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn setTitle:@"新建" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}
#pragma mark - 进入新建地址
-(void)createAddr
{
    WDCreatAddrController *descVc = [[WDCreatAddrController alloc]init];
    descVc.title = @"新建收货地址";
    [self.navigationController pushViewController:descVc animated:YES];
}
#pragma mark - 请求地址
-(void)requestAddr
{
    NSString *locatedCityName = [WDSingleton sharedInstance].locatedCityName;
    if (locatedCityName == nil || locatedCityName.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"未获取到城市信息!"];
        return;
    }
    CLLocation *location = [WDSingleton sharedInstance].locatedLocation;
    NSDictionary *positionInfo = @{
                                   @"districtId":@"0",
                                   @"position_x":@(location.coordinate.longitude),
                                   @"position_y":@(location.coordinate.latitude),
                                   @"addressInfo":locatedCityName,
                                   @"phoneCode":@""
                                   };
    WDUserInfo *user = [WDUserTool currentUser];
    if (user == nil) {
        [SVProgressHUD showInfoWithStatus:@"请先登录您的帐号!"];
        return;
    }
    NSString*signatureStr = [NSString stringWithFormat:@"%@&%@",[WDHttpRequestTool appSecret],user.access_token_secret];
    NSString *signature = [WDHttpRequestTool digest:signatureStr];
    NSDictionary *accessInfo = @{
                                 @"app_key":[WDHttpRequestTool appKey],
                                 @"access_token":user.access_token,
                                 @"signature":signature,
                                 @"phone_num":user.phone_num
                                 };
    NSDictionary *param = @{
                            @"accessInfo":accessInfo,
                            @"positionInfo":positionInfo
                            };
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:param];
    NSString *sign = [WDHttpRequestTool sign:params];
    [params setObject:sign forKey:@"sign"];
    [WDHttpRequestTool requestWithUrl:@"delieveryAddress/show" params:params successBlock:^(id json) {
        NSArray *array = [WDAddressModel mj_objectArrayWithKeyValuesArray:json];
        self.allData = array;
        [self.tableView reloadData];
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDAddressModel *model = self.allData[indexPath.section];
    WDAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:AddressCellKey ];
    cell.addrM = model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}
@end
