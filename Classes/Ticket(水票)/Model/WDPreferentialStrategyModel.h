//
//  WDPreferentialStrategyModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/9.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDBaseModel.h"

@interface WDPreferentialStrategyModel : WDBaseModel
@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,copy)NSString *description;
@property(nonatomic,assign)int giveCount;
@property(nonatomic,assign)int id;
@property(nonatomic,copy)NSString *preferentialStrategyType;
@property(nonatomic,assign)int requireCount;

@end
