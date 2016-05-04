//
//  WDSingleton.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>

@interface WDSingleton : NSObject
+(WDSingleton *)sharedInstance;


//定位城市
@property(copy,nonatomic)NSString* locatedCityName;
//选择城市
@property(copy,nonatomic)NSString* selectedCityName;

//定位位置
@property(copy,nonatomic)CLLocation* locatedLocation;
//选择位置
@property(copy,nonatomic)CLLocation* selectedLocation;


// 城市数组
@property(nonatomic,strong)NSArray *cities;

@end
