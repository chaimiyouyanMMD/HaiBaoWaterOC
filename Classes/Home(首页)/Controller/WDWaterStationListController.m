//
//  WDWaterStationListController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/6.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define cellKey @"WDWaterStationListController"
#import "WDWaterStationListController.h"
#import "WDWaterStationListCell.h"
#import <MAMapKit/MAMapKit.h>
#import "WDUserTool.h"
#import "WDShopListModel.h"
#import "MJExtension.h"
#import "WDWaterStationController.h"

@interface WDWaterStationListController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *allData;
@end

@implementation WDWaterStationListController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WDWaterStationListCell class] forCellReuseIdentifier:cellKey];
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self requestNearStation];
}
#pragma mark - 请求附近水站
- (void)requestNearStation{
    
    [WDUserTool getNearWaterStationWithLocation:self.location address:self.addrInfo keyWord:nil PageSize:50 PageNo:10 SuccessBlock:^(id json) {
        NSArray *shopList = [WDShopListModel mj_objectArrayWithKeyValuesArray:json[@"shopList"]];
        self.allData = shopList;
        [self.tableView reloadData];
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDShopListModel *model = self.allData[indexPath.row];
    WDWaterStationListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellKey];
    cell.shopM = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDShopListModel *model = self.allData[indexPath.row];
    WDWaterStationController *descVc = [[WDWaterStationController alloc]init];
    descVc.title = [NSString stringWithFormat:@"%@水站",model.merchantName];
    descVc.model = model;
    [self.navigationController pushViewController:descVc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
@end
