//
//  WDCellModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#import "WDBaseModel.h"

@interface WDCellModel : WDBaseModel
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)Class descVc;
@property(nonatomic,strong)NSString *subTitle;
@property(nonatomic,assign)UITableViewCellAccessoryType accessoryType;
-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title  subTitle:(NSString *)subTitle descVc:(Class)descVc accessoryType:(UITableViewCellAccessoryType )accessoryType;
@end
