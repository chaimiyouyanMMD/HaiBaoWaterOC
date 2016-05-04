//
//  WDWaterStationListController.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/6.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDTableViewController.h"

@interface WDWaterStationListController : WDTableViewController
// 我的位置信息
@property(nonatomic,copy)CLLocation *location;
//我的当前位置
@property(nonatomic,copy)NSString *addrInfo;
@end
