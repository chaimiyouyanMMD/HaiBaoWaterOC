//
//  WDShoppingItemCar.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/5.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDShoppingItemCarModel : NSObject
//cardTicketId = "<null>";
//
//giveCount = "<null>";
//
//imageUrl = "http://114.251.53.22/huipayResource/hproduct/d2610683-757f-44af-91be-53de47834d5e.JPEG";
//
//itemId = 104;
//
//num = 1;
//
//preferentialId = "<null>";
//
//price = 100;
//
//productId = 117750;
//
//productName = "\U9ec4\U8f89\U5b8f";
//
//productType = 7;
//
//shopId = 40620;
@property(nonatomic,assign)int cardTicketId;
@property(nonatomic,assign)int giveCount;
@property(nonatomic,copy)NSString *imageUrl;
@property(nonatomic,assign)int itemId;
@property(nonatomic,assign)int num;
@property(nonatomic,assign)int preferentialId;
@property(nonatomic,assign)CGFloat price;
@property(nonatomic,assign)int productId;
@property(nonatomic,copy)NSString *productName;
@property(nonatomic,assign)int productType;
@property(nonatomic,assign)int shopId;
// 商品是否选中
@property(nonatomic,assign)BOOL selected;

@end
