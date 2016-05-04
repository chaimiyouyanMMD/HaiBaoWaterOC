//
//  WDLocationMgr.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
typedef void (^SuccessBlock)();
#import <Foundation/Foundation.h>

@interface WDLocationMgr : NSObject
+(instancetype)shareMgr;
// 重新定位
//+(void)locationMe;
+(NSArray *)getCitiesByCityName:(NSString *)cityName;
+(NSArray *)getCitiesByCondition:(BOOL)hot;
// 网络获取城市列表
+(void)loadCityListSuccessBlock:(SuccessBlock)complete;
// 根据城市名字，获取城市id
+(NSNumber*)getCityIdByCityName:(NSString*)cityName;
@end
