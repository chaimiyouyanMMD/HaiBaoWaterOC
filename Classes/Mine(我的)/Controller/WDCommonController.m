//
//  WDCommonController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/29.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define WDCommonControllerCellKey @"WDCommonController"
#import "WDCommonController.h"
#import "WDSettingController.h"
#import "WDMineCell.h"
@interface WDCommonController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *allData;
@end

@implementation WDCommonController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WDMineCell class] forCellReuseIdentifier:WDCommonControllerCellKey];
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self loadData];
}

- (void)loadData {
    WDCellModel *share = [[WDCellModel alloc]initWithIcon:@"tongyong_fenxianghaibao" title:@"分享" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *merchant = [[WDCellModel alloc]initWithIcon:@"tongyong_shangjairuzhu-" title:@"商家入驻" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *user = [[WDCellModel alloc]initWithIcon:@"tongyong_yonghuxieyi" title:@"用户协议" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *message = [[WDCellModel alloc]initWithIcon:@"tongyong_xiaoxitixing" title:@"消息提醒" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *about = [[WDCellModel alloc]initWithIcon:@"tongyong_guanyuhaibao" title:@"关于海豹" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *setting = [[WDCellModel alloc]initWithIcon:@"tongyong_Setting" title:@"设置" subTitle:@"" descVc:[WDSettingController class] accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.allData = @[@[share],@[merchant,user],@[message,about],@[setting]];
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
    WDMineCell *cell = [tableView dequeueReusableCellWithIdentifier:WDCommonControllerCellKey];
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
    [self.navigationController pushViewController:descVc animated:YES];
}
@end
