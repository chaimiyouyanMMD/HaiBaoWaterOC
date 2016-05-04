//
//  WDLoactionController.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDTableViewController.h"
typedef void (^LocationCompleBlock)(NSString *cityName);
@interface WDLocationController : WDTableViewController
@property(nonatomic,strong)NSString *currentCityName;
@property(nonatomic,copy)LocationCompleBlock cityBlock;
@end
