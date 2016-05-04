//
//  WDPayResultController.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/19.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDPayResultController.h"
#import "WDPayResultView.h"
#import "WDOrderDetailController.h"

@interface WDPayResultFootView:UIView
@property(nonatomic,weak)UIButton *againPayBtn;
@property(nonatomic,weak)UIButton *cancelPayBtn;

@end
@implementation WDPayResultFootView
-(instancetype)init
{
    if (self = [super init]) {
        UIButton *againPayBtn = [[UIButton alloc]init];
        [againPayBtn setBackgroundImage:[UIImage imageNamed:@"bg_blue"] forState:UIControlStateNormal];
        [againPayBtn setTitle:@"重新支付" forState:UIControlStateNormal];
        [againPayBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        againPayBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        self.againPayBtn = againPayBtn;
        [self addSubview:againPayBtn];
        [againPayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(12);
            make.right.mas_equalTo(-12);
            make.height.mas_equalTo(44);
        }];
        
        UIButton *cancelPayBtn = [[UIButton alloc]init];
        [cancelPayBtn setBackgroundImage:[UIImage imageNamed:@"btn_gray"] forState:UIControlStateNormal];
        [cancelPayBtn setTitle:@"取消支付" forState:UIControlStateNormal];
        [cancelPayBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cancelPayBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        self.cancelPayBtn = cancelPayBtn;
        [self addSubview:cancelPayBtn];
        [cancelPayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.right.mas_equalTo(-12);
            make.height.mas_equalTo(44);
            make.top.mas_equalTo(againPayBtn.mas_bottom).offset(20);
        }];
    }
    return self;
}
@end

@interface WDPayResultController ()<UITableViewDelegate>
@property(nonatomic,weak)WDPayResultFootView *footView;
@property(nonatomic,weak)WDPayResultView *headView;

@end
@implementation WDPayResultController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    self.tableView.delegate = self;
    WDPayResultView *headView = [[WDPayResultView alloc]init];
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 190);
    self.tableView.tableHeaderView = headView;
    
    WDPayResultFootView *footView = [[WDPayResultFootView alloc]init];
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120);
    self.tableView.tableFooterView = footView;
    
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(0, 0, 60, 40);
    [rightBtn setTitle:@"订单详情" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor colorWithHexString:@"44a4ef"] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn addTarget:self action:@selector(goOrderDetail) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)goOrderDetail
{
    WDOrderDetailController *desc = [[WDOrderDetailController alloc]init];
    desc.title = @"订单详情";
    [self.navigationController pushViewController:desc animated:YES];
}
@end
