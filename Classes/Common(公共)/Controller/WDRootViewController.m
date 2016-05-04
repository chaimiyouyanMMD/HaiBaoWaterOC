//
//  WDRootViewController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#import "WDRootViewController.h"
#import "WDLoginController.h"

@interface WDRootViewController ()

@end

@implementation WDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    
    // 注册登录的通知
   NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
   [center addObserver:self selector:@selector(login) name:@"login" object:nil];
}
#pragma mark - 注册通知
-(void)login
{
    WDLoginController *descVc = [[WDLoginController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:descVc];
    [self presentViewController:nav animated:YES completion:nil];
    
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}
@end
