//
//  WDCellSectionModel.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDCellSectionModel.h"

@implementation WDCellSectionModel
+(instancetype)sectionWithItems:(NSArray *)items secHeadView:(UIView *)secHeadView secHeadHeight:(CGFloat)secHeadHeight
{
    WDCellSectionModel *secModel = [[WDCellSectionModel alloc] init];
    secModel.items = items;
    secModel.secHeadView = secHeadView;
    secModel.secHeadHeight = secHeadHeight;
    return secModel;
    
}
@end
