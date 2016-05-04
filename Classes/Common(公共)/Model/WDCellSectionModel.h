//
//  WDCellSectionModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDBaseModel.h"

@interface WDCellSectionModel : NSObject
@property(nonatomic,strong)NSArray *items;
@property(nonatomic,strong)UIView *secHeadView;
@property(nonatomic,assign)CGFloat secHeadHeight;
+(instancetype)sectionWithItems:(NSArray *)items secHeadView:(UIView *)secHeadView secHeadHeight:(CGFloat)secHeadHeight;
@end
