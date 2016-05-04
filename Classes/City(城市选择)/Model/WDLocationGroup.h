//
//  WDLocationGroup.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDLocationGroup : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSArray *locations;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign,getter=isOpened)BOOL opented;
+(instancetype)groupWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
