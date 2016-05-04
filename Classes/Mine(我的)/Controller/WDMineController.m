//
//  WDMineController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define WDMineControllerCellKey @"WDMineController"
#import "WDMineController.h"
#import "WDMineHeadView.h"
#import "WDCommonController.h"
#import "WDUserInfoController.h"
#import "WDMineInfoView.h"
#import "WDAllOrderView.h"
#import "WDSectionView.h"
#import "WDButton.h"
#import "WDMineCell.h"
#import "WDReadPayController.h"
#import "WDReadReceivingController.h"
#import "WDPayController.h"
#import "WDPayResultController.h"
#import "WDUserTool.h"
#import "SVProgressHUD.h"
@interface WDMineController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *allData;
@property(nonatomic,weak)WDMineHeadView *headView;
@end

@implementation WDMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WDMineCell class] forCellReuseIdentifier:WDMineControllerCellKey];
    self.tableView.tableFooterView = [[UIView alloc]init];
    // 头部
    WDMineHeadView *headView = [[WDMineHeadView alloc]init];
    headView.frame = CGRectMake(0, 0,SCREEN_WIDTH , 210);
    [headView.infoView addTarget:self action:@selector(goInfo) forControlEvents:UIControlEventTouchUpInside];
    [headView.allOrder.titleView addTarget:self action:@selector(allOrder) forControlEvents:UIControlEventTouchUpInside];
    [headView.allOrder.payBtn addTarget:self action:@selector(pay) forControlEvents:UIControlEventTouchUpInside];
    [headView.allOrder.receivingBtn addTarget:self action:@selector(receiving) forControlEvents:UIControlEventTouchUpInside];
    [headView.allOrder.evaluateBtn addTarget:self action:@selector(evaluate) forControlEvents:UIControlEventTouchUpInside];
    [headView.allOrder.returnBtn addTarget:self action:@selector(returnClick) forControlEvents:UIControlEventTouchUpInside];

    self.headView = headView;
    self.tableView.tableHeaderView = headView;
   
    
    [self loadData];
}
#pragma mark - 进入个人信息
-(void)goInfo
{
    if([WDUserTool hasLogin]){
        WDUserInfoController *descVc = [[WDUserInfoController alloc]init];
        descVc.title = @"个人信息";
        descVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:descVc animated:YES];
    }else{
//        [SVProgressHUD showInfoWithStatus:@"请登录"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"login" object:nil];
    }
    
}
#pragma mark - 全部订单
-(void)allOrder
{
    WDPayResultController *desc = [[WDPayResultController alloc]init];
    desc.hidesBottomBarWhenPushed = YES;
    desc.title = @"快捷支付";
    [self.navigationController pushViewController:desc animated:YES];
}
#pragma mark - 待支付
-(void)pay
{
    WDReadPayController *payVc = [[WDReadPayController alloc]init];
    payVc.title = @"待付款";
    [self.navigationController pushViewController:payVc animated:YES ];
}
#pragma mark - 待收货
-(void)receiving
{
    WDReadReceivingController *desc = [[WDReadReceivingController alloc]init];
    desc.title = @"待收货";
    [self.navigationController pushViewController:desc animated:YES];
}
#pragma mark - 待评价
-(void)evaluate
{
    NSLog(@"待评价");
}
#pragma mark - 退换
-(void)returnClick
{
   NSLog(@" 退换");
}
-(void)loadData
{
    WDCellModel *wallet = [[WDCellModel alloc]initWithIcon:@"me_icon_wallet" title:@"钱包" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *ticket = [[WDCellModel alloc]initWithIcon:@"me_icon_shuipiao" title:@"水票" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *daijinjuan = [[WDCellModel alloc]initWithIcon:@"me_icon_voucher" title:@"代金劵" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *collect = [[WDCellModel alloc]initWithIcon:@"me_icon_collect" title:@"收藏" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *setting = [[WDCellModel alloc]initWithIcon:@"me_icon_tongyong" title:@"通用" subTitle:@"" descVc:[WDCommonController class] accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.allData = @[@[wallet,ticket,daijinjuan],@[collect,setting]];
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
    WDMineCell *cell = [tableView dequeueReusableCellWithIdentifier:WDMineControllerCellKey];
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
    UIViewController *descVc = [[model.descVc alloc] init];
    descVc.title = model.title;
    descVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:descVc animated:YES];
}
@end
