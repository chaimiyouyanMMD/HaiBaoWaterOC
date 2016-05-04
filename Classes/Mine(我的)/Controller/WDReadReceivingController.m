//
//  WDReadReceivingController.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/12.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDReadReceivingController.h"
#import "WDReadReceivingCell.h"
#import "WDReadPayHeadView.h"
#import "WDReadPayFoootView.h"

@interface WDReadReceivingController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WDReadReceivingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WDReadReceivingCell class] forCellReuseIdentifier:@"WDReadReceivingController"];
    self.tableView.tableFooterView = [[UIView alloc]init];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDReadReceivingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDReadReceivingController"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    WDReadPayHeadView *headView = [[WDReadPayHeadView alloc]init];
    return headView;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44 ;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    WDReadPayFoootView *footView = [[WDReadPayFoootView alloc]init];
    return footView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 90;
}
@end
