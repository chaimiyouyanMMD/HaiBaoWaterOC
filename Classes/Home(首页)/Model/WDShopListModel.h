//
//  WDShopListModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/6.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDShopListModel : NSObject
//{
//    address = "\U5317\U4eac\U5e02\U897f\U57ce\U533a\U5c55\U89c8\U8def\U8857\U9053\U7cae\U79d1\U5927\U53a6(\U767e\U4e07\U5e84\U5927\U8857)\U9644\U8fd1";
//    canDeleiver = 0;
//    distance = "11603745.67118576";
//    imageList =             (
//                             {
//                                 size = "<null>";
//                                 url = "http://114.251.53.22/huipayResource/hmerchant/3f6dfadd-f2cd-4b5d-90ec-92325d0c68e4_small.jpg";
//                             }
//                             );
//    isCooperate = 1;
//    merchantName = "\U4e0a\U7ebf\U7b2c\U4e00\U5e97";
//    monthSailCount = 3397;
//    policyInfo = "\U4e70\U4e00\U9001\U4e00";
//    sales = "<null>";
//    score = 0;
//    segmentId = 23085;
//    shopId = 40715;
//    shopName = "<null>";
//    shopTelephone = "";
//    smallImage = "<null>";
//    telphone = "";
//    xAxis = "39.928741";
//    yAxis = "116.350662";
//},
@property(nonatomic,copy)NSString *address;
@property(nonatomic,assign)int canDeleiver;
@property(nonatomic,assign)CGFloat distance;
@property(nonatomic,copy)NSArray *imageList;
@property(nonatomic,assign)int isCooperate;
@property(nonatomic,copy)NSString *merchantName;
@property(nonatomic,assign)int monthSailCount;
@property(nonatomic,copy)NSString *policyInfo;
@property(nonatomic,copy)NSString *sales;
@property(nonatomic,assign)int score;
@property(nonatomic,assign)int segmentId;
@property(nonatomic,copy)NSString *shopName;
@property(nonatomic,assign)int shopId;
@property(nonatomic,copy)NSString *shopTelephone;
@property(nonatomic,copy)NSString *smallImage;
@property(nonatomic,copy)NSString *telphone;
@property(nonatomic,copy)NSString *xAxis;
@property(nonatomic,copy)NSString *yAxis;

@end
