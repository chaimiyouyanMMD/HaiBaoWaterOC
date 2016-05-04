//
//  WDConfirmOrderController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/9.
//  Copyright © 2016年 huibei. All rights reserved.
//
#define WDConfirmOrderCellKey @"WDConfirmOrderController"
#import "WDConfirmOrderController.h"
#import "WDConfirmOrderAddrView.h"
#import "WDConfirmOrderFootView.h"
#import "WDConfirmOrderCell.h"
#import "WDUserTool.h"
#import "WDHttpRequestTool.h"
#import "WDUserInfo.h"
#import "WDDefaultAddressModel.h"
#import "WDConfirmOrderAddrView.h"
@interface WDConfirmOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)WDConfirmOrderAddrView *headView;
@property(nonatomic,strong)WDDefaultAddressModel *addrM;

@end

@implementation WDConfirmOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 120.0f; // set this to whatever your
    self.tableView.allowsSelection = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine ;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.tableView registerClass:[WDConfirmOrderCell class] forCellReuseIdentifier:WDConfirmOrderCellKey];
    
    [self getDefaultAddr];
}
#pragma mark - 获取默认的收货地址
-(void)getDefaultAddr
{
    if ([WDUserTool hasLogin]) {
        WDUserInfo *user = [WDUserTool currentUser];
        NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@&%@",[WDHttpRequestTool appSecret],user.access_token_secret]];
        NSDictionary *accessInfo = @{
                                     @"signature":signature,
                                     @"app_key":[WDHttpRequestTool appKey],
                                     @"access_token":user.access_token,
                                     @"phone_num":user.phone_num
                                     };
        NSDictionary *param = @{
                                @"accessInfo":accessInfo,
                                @"sign":@"sign"
                                };
        [WDHttpRequestTool requestWithUrl:@"delieveryAddress/showDefaultAddress" params:param successBlock:^(id json) {
            WDDefaultAddressModel *addrM = [WDDefaultAddressModel mj_objectWithKeyValues:json];
            self.addrM = addrM;
            [self settingAddressViewWith:addrM];
            [self.tableView reloadData];
        }];
    }
}
#pragma mark - 显示默认地址
-(void)settingAddressViewWith:(WDDefaultAddressModel *)addrM;
{
    WDConfirmOrderAddrView *headView = [[WDConfirmOrderAddrView alloc]init];
    if (addrM) {
        headView.addrM = self.addrM;
        headView.addrView.hidden = NO;
        headView.noAddrView.hidden = YES;
        headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 140);
    }else{
        headView.addrView.hidden = YES;
        headView.noAddrView.hidden = NO;
        headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
    }
    self.headView = headView;
    self.tableView.tableHeaderView = headView;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDConfirmOrderCell *cell = [[WDConfirmOrderCell alloc]init];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 12;
}

@end
