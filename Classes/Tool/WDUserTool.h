//
//  WDUserTool.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/31.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
typedef void (^StationBlock)(id json);
@interface WDUserTool : NSObject
+(WDUserInfo *)currentUser;
+(BOOL)hasLogin;
// 获取 附近位置
+(void)getNearWaterStationWithLocation:(CLLocation *)location address:(NSString *)address keyWord:(NSString *)keyWord PageSize:(int)pageSize PageNo:(int)pageNo SuccessBlock:(StationBlock)success;
@end
