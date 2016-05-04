//
//  WDUserTool.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/31.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDUserTool.h"
#import "FMDB.h"
#import "WDUserInfo.h"
#import "WDHttpRequestTool.h"

@implementation WDUserTool
+(WDUserInfo *)currentUser
{
    NSArray *users = [WDUserInfo allDbObjects];
    if (users.count) {
        return [users lastObject];
    }
    return nil;
}
+(BOOL)hasLogin
{
    WDUserInfo *user = [self currentUser];
    if (user == nil || user.access_token == nil) {
        return NO;
    }
    return YES;
}
+(void)getNearWaterStationWithLocation:(CLLocation *)location address:(NSString *)address keyWord:(NSString *)keyWord PageSize:(int)pageSize PageNo:(int)pageNo SuccessBlock:(StationBlock)success
{
    NSString *addr = address == nil ? @"" : address;
    NSDictionary *positionInfo = @{
                                   @"districtId":@"010",
                                   @"position_x":[NSNumber numberWithFloat:location.coordinate.longitude],
                                   @"position_y":[NSNumber numberWithFloat:location.coordinate.latitude],
                                   @"addressInfo":addr
                                   };
    NSDictionary *requestPageInfo = @{
                                      @"pageSize":@(pageSize),
                                      @"pageNo":@(pageNo)
                                      };
    NSDictionary *accessInfo = @{
                                 @"app_key":[WDHttpRequestTool appKey],
                                 @"signature":[WDHttpRequestTool digest:[WDHttpRequestTool appSecret]]
                                 };
    NSDictionary *param = @{
                            @"positionInfo":positionInfo,
                            @"requestPageInfo":requestPageInfo,
                            @"accessInfo":accessInfo,
                            @"sign":@"sign1"
                            };
    if (keyWord != nil || keyWord.length != 0) {
        param = @{
                @"positionInfo":positionInfo,
                @"requestPageInfo":requestPageInfo,
                @"accessInfo":accessInfo,
                @"sign":@"sign1",
                @"keyWord":keyWord
                };
    }
    
    [WDHttpRequestTool requestWithUrl:@"shopList/shop" params:param successBlock:^(id json) {
        success(json);
    }];
    
}
@end
