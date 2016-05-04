//
//  WDEditNameController.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/29.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDViewController.h"

@interface WDEditNameController : WDViewController
@property(nonatomic,copy)void(^saveNameBlock)(NSString *name);
@end
