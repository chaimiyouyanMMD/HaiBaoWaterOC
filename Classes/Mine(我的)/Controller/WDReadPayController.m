//
//  WDReadPayController.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/12.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDReadPayController.h"
#import "WDReadPayCell.h"

@interface WDReadPayController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WDReadPayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WDReadPayCell class] forCellReuseIdentifier:@"WDReadPayController"];
    self.tableView.tableFooterView = [[UIView alloc]init];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDReadPayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDReadPayController"];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 12;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 12)];
    bgView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    return  bgView;
}
@end
