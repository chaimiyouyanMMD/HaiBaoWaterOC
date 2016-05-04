//
//  WDHttpRequestTool.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/31.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define DebugMode 1
#ifdef DebugMode
// 测试环境
#define HBAppKey @"e330ce4aa98546b3b99329d20e17450b"
#define HBAppSecret @"165416"
#define baseUrl @"http://114.251.53.22/huipaywater/"
#else
// 正式环境
#define  HBMAppKey @"cf385992c3fc46cbaebae2c1dae08653"
#define  HBMAppSecret @"5e5cd8e3ccca45c2a5a3b00a5a90cdd5"
#define baseUrl @"http://www.huipay.com/huipaywater/"
#endif




#import "WDHttpRequestTool.h"
#import "AFNetworking.h"
#import "AFNetworkReachabilityManager.h"
#import "SVProgressHUD.h"
#import "CommonCrypto/CommonDigest.h"
@implementation WDHttpRequestTool
+(void)requestWithUrl:(NSString *)url params:(NSDictionary *)params successBlock:(WDRequestSuccess)success
{
    // 0.判断网络状态
//    if([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus <= AFNetworkReachabilityStatusNotReachable){
//        [SVProgressHUD showErrorWithStatus:@"您的网络状态较差!"];
//    };
    
    // 1.创建请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 2.设置请求的格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    // 3.设置响应的格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    // 4.拼接请求的路径
    NSString *path = [NSString stringWithFormat:@"%@%@",baseUrl,url];
    
    // 5.发送请求
    [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [SVProgressHUD dismiss];
        if (responseObject != nil) {
            NSDictionary *dic = [self toArrayOrNSDictionary:responseObject];
            success(dic);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (operation.responseData != nil) {
            NSDictionary* d = [self toArrayOrNSDictionary:operation.responseData] ;
            NSString* errorInfo = d[@"errorInfo"] ;
            NSString* errDescription = error.userInfo[@"NSLocalizedDescription"] ;
            if (errorInfo != nil) {
                [SVProgressHUD showErrorWithStatus:errorInfo];
            }
            else if (errDescription != nil){
                [SVProgressHUD showErrorWithStatus:errDescription];
            }
            else{
                [SVProgressHUD showErrorWithStatus:@"您的网络状况较差！"];
            }
        }
        else{
            [SVProgressHUD showErrorWithStatus:@"您的网络状况较差！"];
        }

    }];
}
#pragma mark - 获取请求路径
+(NSString *)getRequestUrl:(NSString *)url
{
    return [NSString stringWithFormat:@"%@%@",baseUrl,url];
}
+(NSString *)appKey
{
    return HBAppKey;
}
+(NSString *)appSecret
{
    return HBAppSecret;
}
#pragma mark -  sign 签名
+ (NSString*)sign:(NSMutableDictionary *)params
{
    NSArray *sortedKeys = [params.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSMutableString *signStr = [NSMutableString string];
    
    for (NSString *key in sortedKeys) {
        [signStr appendFormat:@"&%@=%@", key, params[key]];
    }
    // 删掉最前面的&
    [signStr deleteCharactersInRange:NSMakeRange(0, 1)];
    // 增加URL加密的key
    [signStr appendString:HBAppSecret];
    return [self digest:signStr];
}
#pragma mark - 签名（md5 加密）
+(NSString *)digest:(NSString *)source
{
    const char *cStr = [source UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    NSMutableString *md5str = [NSMutableString string];
    int count = sizeof(result)/sizeof(unsigned char);
    for (int i = 0; i<count; i++) {
        [md5str appendFormat:@"%02X", result[i]];
    }
    return md5str.uppercaseString;
}
// 讲jsonData转为数组或字典
+(id)toArrayOrNSDictionary:(NSData *)jsonData
{
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
}
+(NSDictionary *)getAccessInfo
{
    WDUserInfo *user = [WDUserTool currentUser];
    NSString *app_Key = [self appKey];
    NSString *access_token = user.access_token;
    NSString *signature = [self digest:[NSString stringWithFormat:@"%@%@",user.access_token,user.access_token_secret]];
    NSDictionary *accessInfo = @{
                                 @"app_Key":app_Key,
                                 @"access_token":access_token,
                                 @"signature":signature,
                                 @"phone_num":user.phone_num
                                 };
    return accessInfo;
}
@end
