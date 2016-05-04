//
//  WDCellModel.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDCellModel.h"

@implementation WDCellModel
-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title  subTitle:(NSString *)subTitle descVc:(Class)descVc accessoryType:(UITableViewCellAccessoryType)accessoryType
{
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
        self.subTitle = subTitle;
        self.descVc = descVc;
        self.accessoryType = accessoryType;
    }
    return self;
}
@end
