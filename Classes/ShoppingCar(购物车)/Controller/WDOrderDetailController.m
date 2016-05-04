//
//  WDOrderDetailController.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/19.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDOrderDetailController.h"
#import "WDOrderDetailHeadView.h"
#import "WDOrderDetailFootView.h"
#import "WDShoppingCarCell.h"
#import "WDOrderDetailFootBar.h"
#import "WDShoppingCarHeadView.h"
#import "WDOrderDetailCell.h"

@interface WDOrderDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)WDOrderDetailHeadView *headView;
@property(nonatomic,weak)WDOrderDetailFootBar *footBar;
@property(nonatomic,weak)UITableView *tableView;
@end
@implementation WDOrderDetailController
-(void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [tableView registerClass:[WDOrderDetailCell class] forCellReuseIdentifier:@"WDOrderDetailCell"];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-44);
    }];
    
    WDOrderDetailFootBar *footBar = [[WDOrderDetailFootBar alloc]init];
    self.footBar = footBar;
    [self.view addSubview:footBar];
    [footBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    WDOrderDetailHeadView *headView = [[WDOrderDetailHeadView alloc]init];
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 190);
    self.tableView.tableHeaderView = headView;
    self.tableView.delegate = self;
    self.tableView.tableHeaderView = headView;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDOrderDetailCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    WDOrderDetailCellHeadView *headView = [[WDOrderDetailCellHeadView alloc]init];
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    WDOrderDetailFootView *footView = [[WDOrderDetailFootView alloc]init];
    return footView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 224;
}
@end
