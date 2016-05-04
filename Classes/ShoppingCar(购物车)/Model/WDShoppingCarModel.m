//
//  WDShoppingCarModel.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/5.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDShoppingCarModel.h"

@implementation WDShoppingCarModel
+ (NSDictionary *)objectClassInArray{
    return @{
             @"itemList" : @"WDShoppingItemCarModel"
             };
}
@end
