//
//  WDShareModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/11.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDShareModel : NSObject
//Printing description of json:
//{
//    logo = "http://114.251.53.22/huipayResource/hmerchant/78ff5c88-dd91-4523-8f10-c251d89f299f_small.jpg";
//    name = "\U6d77\U5c14\U5144\U5f1f003";
//    url = "http://www.huipay.com/huipaywater/04-goo
@property(nonnull,copy)NSString *logo;
@property(nonnull,copy)NSString *name;
@property(nonnull,copy)NSString *url;

@end
