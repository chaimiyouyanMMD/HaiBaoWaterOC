//
//  WDLocationMgr.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDLocationMgr.h"
#import "WDSingleton.h"
#import "WDCityModel.h"
#import "MJExtension.h"
#import <AMapLocationKit/AMapLocationKit.h>

@implementation WDLocationMgr
static WDLocationMgr *_locationMgr;
+(instancetype)shareMgr
{
    if (_locationMgr == nil) {
        _locationMgr = [[self alloc]init ];
    }
    return _locationMgr;
}
//+(void)locationMe
//{
//    AMapLocationManager *locationManger = [[AMapLocationManager alloc]init];
//    locationManger.desiredAccuracy = kCLLocationAccuracyHundredMeters;
//    [locationManger requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
//        if (error) {
//            NSLog(@"error.code = %ld - error.localizedDescription = %@",error.code,error.localizedDescription);
//            if (error.code == 5) {
//                return ;
//            }
//        }
//        if (regeocode) {
//            NSLog(@"%@",regeocode);
//            NSString *cityName;
//            if (regeocode.province) {
//                cityName = regeocode.province;
//            }
//            if (regeocode.city) {
//                cityName = regeocode.city;
//            }
//            if (cityName != nil && cityName.length != 0) {
//                [WDSingleton sharedInstance].locatedCityName = cityName;
//                [WDSingleton sharedInstance].selectedCityName = cityName;
//            }
//            [WDSingleton sharedInstance].selectedLocation = location;
//            [WDSingleton sharedInstance].locatedLocation = location;
//            NSString *addr = regeocode.formattedAddress;
//            [self locationNotificate:location cityName:cityName addr:addr];
//        }
//    }];
//}
//// 位置更新的通知
//+(void)locationNotificate:(CLLocation *)location cityName:(NSString *)cityName addr:(NSString *)addr
//{
//    NSDictionary *object = @{
//                             @"location":location,
//                             @"cityName":cityName,
//                             @"addr":addr
//                             };
//    [[NSNotificationCenter defaultCenter] postNotificationName:LocaOK object:self userInfo:object];
//}
//根据城市名字获取城市模型
+(NSArray *)getCitiesByCityName:(NSString *)cityName
{
    NSMutableArray *result = [NSMutableArray array];
    NSArray *cities = [WDSingleton sharedInstance].cities;
    for (WDCityModel *cityModel in cities) {
        NSString *label = cityModel.label;
        if ([label containsString:cityName]) {
            [result addObject:cityModel];
        }
    }
    return result;
}
// 根据条件获取城市数组
+(NSArray *)getCitiesByCondition:(BOOL)hot
{
    NSMutableArray *result = [NSMutableArray array];
    NSArray *cities = [WDSingleton sharedInstance].cities;
    for (WDCityModel *model in cities) {
        if (model.hot == hot) {
            [result addObject:model];
        }
    }
    return result;
}
+(void)loadCityListSuccessBlock:(SuccessBlock)complete
{
    NSArray *cities = [WDSingleton sharedInstance].cities;
    if (cities.count == 0 || cities == nil) {
        NSDictionary *accessInfo = @{
                                     @"app_key":[WDHttpRequestTool appKey],
                                     @"signature":[WDHttpRequestTool digest:[WDHttpRequestTool appSecret]]
                                      };
        NSDictionary *param = @{
                                @"accessInfo":accessInfo,
                                @"sign":[WDHttpRequestTool sign:[NSMutableDictionary dictionaryWithDictionary:accessInfo]]
                                };
        [WDHttpRequestTool requestWithUrl:@"cities" params:param successBlock:^(id json) {
            
            NSArray *cities = [WDCityModel mj_objectArrayWithKeyValuesArray:json[@"cities"]];
            [WDSingleton sharedInstance].cities = cities;
            complete();
        }];
    }else{
        complete();
    }
}
+(NSNumber*)getCityIdByCityName:(NSString*)cityName
{
    if([cityName hasSuffix:@"市"]){
        cityName = [cityName substringToIndex:cityName.length - 1];
    }
    NSArray *cities = [WDSingleton sharedInstance].cities;
    for (WDCityModel *cityM in cities) {
        NSString *label = cityM.label;
        if (label == nil || label.length == 0) continue;
            if ([label containsString:cityName]) {
                return cityM.id;
                break;
            }
    }
    return 0;
}
@end
