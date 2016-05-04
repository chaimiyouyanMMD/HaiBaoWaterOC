//
//  AppDelegate.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#import "AppDelegate.h"
#import "WDTabBarController.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import "WDLocationMgr.h"
#import "WDSingleton.h"

@interface AppDelegate (){
}
@property(nonatomic,strong)NSString *currentCityName;
@property(nonatomic,strong)AMapLocationManager *locationMgr;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    WDTabBarController *tabBarVc = [[WDTabBarController alloc]init];
    self.window.rootViewController = tabBarVc;
    [self.window makeKeyAndVisible];
    // 高德地图的设置
//    [MAMapServices sharedServices].apiKey = @"a9822f0a6860097690a8db77f98547ac";
    [AMapLocationServices sharedServices].apiKey =@"43f8ab3143cc30c696ff22c5ac24d294";
    // 获取城市列表
    [self requstCityList];
    return YES;
}
// 获取城市列表
-(void)requstCityList
{
    NSArray *cities = [WDSingleton sharedInstance].cities;
    if (cities == nil || cities.count == 0) {
        [WDLocationMgr loadCityListSuccessBlock:^{
            
        }];
    }
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   // 定位我的位置
    [self locationMe];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - 定位我的位置
-(void)locationMe
{
    AMapLocationManager *locationMgr = [[AMapLocationManager alloc]init];
    self.locationMgr = locationMgr;
    locationMgr.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationMgr requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error) {
            NSLog(@"error.code = %ld - error.localizedDescription = %@",error.code,error.localizedDescription);
            if (error.code == 5) {
                return ;
            }
        }
        if (regeocode) {
            NSLog(@"%@",regeocode);
            NSString *cityName;
            if (regeocode.province) {
                cityName = regeocode.province;
            }
            if (regeocode.city) {
                cityName = regeocode.city;
            }
            if (cityName != nil && cityName.length != 0) {
                [WDSingleton sharedInstance].locatedCityName = cityName;
                [WDSingleton sharedInstance].selectedCityName = cityName;
            }
            [WDSingleton sharedInstance].selectedLocation = location;
            [WDSingleton sharedInstance].locatedLocation = location;
            self.currentCityName = cityName;
            NSString *addr = regeocode.formattedAddress;
            [self locationNotificate:location cityName:cityName addr:addr];
        }
    }];
}
// 位置更新的通知
-(void)locationNotificate:(CLLocation *)location cityName:(NSString *)cityName addr:(NSString *)addr
{
    NSDictionary *object = @{
                              @"location":location,
                              @"cityName":cityName,
                              @"addr":addr
                              };
//    [[NSNotificationCenter defaultCenter] postNotificationName:LocaOK object:object];
    [[NSNotificationCenter defaultCenter] postNotificationName:LocaOK object:self userInfo:object];
}
@end
