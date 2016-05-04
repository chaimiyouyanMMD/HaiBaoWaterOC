//
//  WDLocationGroup.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDLocationGroup.h"
#import "WDLocation.h"
@implementation WDLocationGroup
+(instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 遍历所有的属性
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *locationArray = [NSMutableArray array];
        for (NSString *city in self.locations) {
            WDLocation *loca = [[WDLocation alloc]init];
            loca.name = city;
            [locationArray addObject:loca];
        }
        self.locations = locationArray;
    }
    return self;
}

@end
