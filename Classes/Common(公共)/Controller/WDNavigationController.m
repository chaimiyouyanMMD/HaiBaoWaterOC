//
//  WDNavigationController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDNavigationController.h"


@interface WDNavigationController ()

@end

@implementation WDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = YES;
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];

}

@end
