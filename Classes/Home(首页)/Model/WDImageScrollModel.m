//
//  WDImageScrollCellModel.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/9.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDImageScrollModel.h"

@implementation WDImageScrollModel
+(instancetype)cellWithIcons:(NSArray *)icons shopName:(NSString *)shopName sore:(int)sore shopViewHidden:(BOOL)shopViewHidden
{
    WDImageScrollModel *model = [[WDImageScrollModel alloc]init];
    model.icons = icons;
    model.shopName = shopName;
    model.sore = sore;
    model.shopViewHidden = shopViewHidden;
    return model;
}

@end
