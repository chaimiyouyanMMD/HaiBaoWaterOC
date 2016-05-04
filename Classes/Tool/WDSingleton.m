//
//  WDSingleton.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDSingleton.h"
static WDSingleton* sharedInstance = nil;
@implementation WDSingleton
+(WDSingleton *)sharedInstance
{
    @synchronized(self){
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
            }
    return sharedInstance;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self){
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    return nil;
}
-(id)copyWithZone:(NSZone *)zone
{
    return self;
}
@end
