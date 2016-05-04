//
//  WDSubShopModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDSubShopModel : NSObject
//address = "\U5317\U4eac\U5e02\U897f\U57ce\U533a\U5c55\U89c8\U8def\U8857\U9053\U7cae\U79d1\U5927\U53a6(\U767e\U4e07\U5e84\U5927\U8857)\U9644\U8fd1";
//
//canDeleiver = 0;
//
//distance = 0;
//
//imageList =             (
//
//);
//
//isCooperate = "<null>";
//
//merchantName = "\U6d77\U5c14\U5144\U5f1f003";
//
//monthSailCount = 0;
//
//policyInfo = "<null>";
//
//sales = "<null>";
//
//score = 0;
//
//segmentId = 22993;
//
//shopId = 40596;
//
//shopName = "\U6d77\U5c14\U5144\U5f1f003(\U6d77\U5c14\U5144\U5f1f003)";
//
//shopTelephone = "<null>";
//
//smallImage = "http://114.251.53.22/huipayResource/hmerchant/78ff5c88-dd91-4523-8f10-c251d89f299f_small.jpg";
//
//telphone = "<null>";
//
//xAxis = 0;
//
//yAxis = 0;
@property(nonatomic,copy)NSString *address;

@property(nonatomic,assign)int canDeleiver;
@property(nonatomic,assign)CGFloat distance;
@property(nonatomic,copy)NSString *isCooperate;
@property(nonatomic,copy)NSString *merchantName;
@property(nonatomic,assign)int monthSailCount;
@property(nonatomic,copy)NSString *policyInfo;
@property(nonatomic,copy)NSString *sales;
@property(nonatomic,assign)int score;
@property(nonatomic,assign)int segmentId;
@property(nonatomic,assign)int shopId;
@property(nonatomic,copy)NSString *shopName;
@property(nonatomic,copy)NSString *shopTelephone;
@property(nonatomic,copy)NSString *smallImage;
@property(nonatomic,copy)NSString *telphone;

@property(nonatomic,copy)NSNumber *xAxis;
@property(nonatomic,copy)NSNumber *yAxis;

@end
