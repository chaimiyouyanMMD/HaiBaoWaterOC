//
//  WDProductInfoModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/8.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDBaseModel.h"

@interface WDProductInfoModel : WDBaseModel
//"big_image" = "http://114.251.53.22/huipayResource/hproduct/95293cb9-0407-4810-9704-5f857116c2f9.JPEG";
//cardTicketId = 0;
//distance = 0;
//favourite = 0;
//c =         (
//);
//inventory = 190;
//isFavourite = 0;
//marketPrice = 200;
//merchantName = "<null>";
//price = 1;
//productId = 117691;
//salesCnt = 196;
//shippingFare = "<null>";
//shopId = "<null>";
//shopName = "<null>";
//subTitle = "<null>";
//summary = "\U751c\U871c";
//title = "\U751c\U871c\U871c";
@property(nonatomic,copy)NSString *big_image;
@property(nonatomic,assign)int cardTicketId;
@property(nonatomic,assign)CGFloat distance;
@property(nonatomic,assign)int favourite;
@property(nonatomic,copy)NSArray *images;
@property(nonatomic,copy)NSNumber *inventory;
@property(nonatomic,assign)int isFavourite;
@property(nonatomic,assign)CGFloat marketPrice;
@property(nonatomic,copy)NSString *merchantName;
@property(nonatomic,assign)CGFloat price;
@property(nonatomic,assign)int productId;
@property(nonatomic,assign)int salesCnt;
@property(nonatomic,copy)NSString *shippingFare;
@property(nonatomic,assign)int shopId;
@property(nonatomic,copy)NSString *shopName;
@property(nonatomic,copy)NSString *subTitle;
@property(nonatomic,copy)NSString *summary;
@property(nonatomic,copy)NSString *title;

@end
