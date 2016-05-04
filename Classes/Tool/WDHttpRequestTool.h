//
//  WDHttpRequestTool.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/31.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

typedef void (^WDRequestSuccess)(id json);
#import <Foundation/Foundation.h>
@interface WDHttpRequestTool : NSObject

+(NSString *)appKey;
+(NSString *)appSecret;
+(NSString *)digest:(NSString *)source;
+ (NSString*)sign:(NSMutableDictionary *)params;
+(NSString *)getRequestUrl:(NSString *)url;
// post请求
+(void)requestWithUrl:(NSString *)url params:(NSDictionary *)params successBlock:(WDRequestSuccess)success;
+(NSDictionary *)getAccessInfo;
@end
