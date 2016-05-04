//
//  WDCityModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDCityModel : NSObject
//"first_word" = A;
//hot = 0;
//id = 850939;
//label = "\U6fb3\U95e8";
//name = 999078;
//priority = 1000;
//"x_axis" = "<null>";
//"y_axis" = "<null>";
@property(nonatomic,copy)NSString *first_word;
@property(nonatomic,assign)BOOL hot;
@property(nonatomic,copy)NSNumber *id;
@property(nonatomic,copy)NSString *label;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSNumber *priority;
@property(nonatomic,copy)NSString *x_axis;
@property(nonatomic,copy)NSString *y_axis;

@end
