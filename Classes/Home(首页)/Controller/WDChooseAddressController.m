//
//  WDChooseAddressController.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/13.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDChooseAddressController.h"
#import "WDChooseAddressHeadView.h"

@interface WDChooseAddressController ()
@property(nonatomic,weak)WDChooseAddressHeadView *headView;

@end

@implementation WDChooseAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    WDChooseAddressHeadView *headView = [[WDChooseAddressHeadView alloc]init];
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 107);
    self.headView = headView;
    self.tableView.tableHeaderView = headView;
    [self settingupRightItem];
    
    
}

- (void)settingupRightItem {
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [btn setTitleColor:[UIColor colorWithHexString:@"44a4ef"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.frame = CGRectMake(0, 0, 60, 40);
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
