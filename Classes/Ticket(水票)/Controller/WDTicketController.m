//
//  WDTicketController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define cellKey @"WDTicketController"
#import "WDTicketController.h"
#import "WDTicketCell.h"
#import "WDDropDownItem.h"
#import "WDLocationController.h"
#import "WDSingleton.h"
#import "WDLocationMgr.h"
#import "WDLoginController.h"
#import "WDWaterTicketModel.h"
#import "WDTicketDetailController.h"

@interface WDTicketController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property(nonatomic,weak)WDDropDownItem *leftBtn;
@property(nonatomic,strong)NSArray *allData;
@property(nonatomic,strong)NSString *cityName;

@end

@implementation WDTicketController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[WDTicketCell class] forCellReuseIdentifier:cellKey];
    self.tableView.tableFooterView = [[UIView alloc]init];

    [self setnav];
    [self requestLoadWithPageSize:50 pageNo:10 reset:YES];
}
#pragma mark - navItem
-(void)setnav
{
    WDDropDownItem *leftBtn = [[WDDropDownItem alloc]init];
    NSString *cityName = [WDSingleton sharedInstance].selectedCityName;
    self.cityName = cityName;
    leftBtn.titleLabel.text = cityName;
    [leftBtn addTarget:self action:@selector(chooseCity) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.frame = CGRectMake(-60, 0, 90, 32);
    self.leftBtn = leftBtn;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}
#pragma mark - 城市选择
-(void)chooseCity
{
    WDLocationController *descVc = [[WDLocationController alloc]init];
    descVc.currentCityName = self.cityName;
    descVc.cityBlock = ^(NSString *cityName){
        self.leftBtn.titleLabel.text = cityName;
    };
    descVc.title = @"城市选择";
    descVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:descVc animated:YES];
}
#pragma mark - 加载数据
-(void)requestLoadWithPageSize:(int)pageSize pageNo:(int)pageNo reset:(BOOL)reset
{
    if ([WDUserTool hasLogin]) {
    WDUserInfo *user = [WDUserTool currentUser];

    NSString *signature = [WDHttpRequestTool digest:[WDHttpRequestTool appSecret]];
    NSDictionary *accessInfo = @{
                                 @"signature":signature,
                                 @"app_key":[WDHttpRequestTool appKey]
                                 };
    NSDictionary *requestPageInfo = @{
                                      @"pageSize":@(pageSize),
                                      @"pageNo":@(pageNo)
                                      };
    CLLocation *currentLocation = [WDSingleton sharedInstance].selectedLocation;
    if (currentLocation == nil) {
        [SVProgressHUD showInfoWithStatus:@"未获取到城市信息!"];
        return;
    }
    NSString *cityName = [WDSingleton sharedInstance].selectedCityName;
    self.leftBtn.titleLabel.text = cityName;
    NSNumber *districtId = [WDLocationMgr getCityIdByCityName:cityName];
    if (districtId == nil ) {
        [SVProgressHUD showInfoWithStatus:@"获取城市信息失败!"];
        return;
    }
    NSDictionary *positionInfo = @{
                                   @"districtId":districtId,
                                   @"phoneCode":user.phone_num,
                                   @"position_y":@(currentLocation.coordinate.latitude),
                                   @"position_x":@(currentLocation.coordinate.longitude)
                                   };
    NSDictionary *param = @{
                            @"accessInfo":accessInfo,
                            @"positionInfo":positionInfo,
                            @"requestPageInfo":requestPageInfo,
                            @"sign":@""
                            };
    [WDHttpRequestTool requestWithUrl:@"cardticket/list" params:param successBlock:^(id json) {
        if (json != nil) {
            NSArray *waters = json[@"cardtickets"];
            NSArray *waterModels = [WDWaterTicketModel mj_objectArrayWithKeyValuesArray:waters];
            self.allData = waterModels;
        }else{
            self.tableView.emptyDataSetDelegate = self;
            self.tableView.emptyDataSetSource = self;
        }
        [self.tableView reloadData];
    }];
    
    }
    
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDWaterTicketModel *model = self.allData[indexPath.row];
    WDTicketCell *cell = [tableView dequeueReusableCellWithIdentifier:cellKey];
    cell.ticketM = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDWaterTicketModel *model = self.allData[indexPath.row];
    WDTicketDetailController *desc = [[WDTicketDetailController alloc]init];
    desc.title = @"水票详情";
    desc.ticketModel = model;
    desc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:desc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self requestLoadWithPageSize:50 pageNo:1 reset:YES];
}
#pragma mark - DZNEmptyDataSetDelegate
-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"seals"];
}
-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *title = @"您没有可用的水票!";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:title];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"777777"] range:NSMakeRange(0, 9)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 9)];
    
    return attributedString;
}
-(CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    CGRect frame = self.view.frame;
    return -frame.size.height/6;
}
@end
