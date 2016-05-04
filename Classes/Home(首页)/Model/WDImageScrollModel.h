//
//  WDImageScrollCellModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/9.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDBaseModel.h"

@interface WDImageScrollModel : WDBaseModel
@property(nonatomic,copy)NSArray *icons;
@property(nonatomic,copy)NSString *shopName;
@property(nonatomic,assign)int sore;
@property(nonatomic,assign)BOOL shopViewHidden;
+(instancetype)cellWithIcons:(NSArray *)icons shopName:(NSString *)shopName sore:(int)sore shopViewHidden:(BOOL)shopViewHidden;
@end
