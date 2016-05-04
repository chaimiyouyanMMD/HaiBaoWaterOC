//
//  WDWaterTicketModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/9.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDBaseModel.h"

@interface WDWaterTicketModel : WDBaseModel
//description = "<null>";
//
//endTime = "2016-01-31 00:00";
//
//iconName = "<null>";
//
//id = 1;
//
//inventoryCount = 100;
//
//preferentialStrategyModels =             (
//                                          
//                                          
//                                          
//                                          );
//
//preferentialStrategyStr = "\U6ee110\U90012 \U6ee120\U90015 \U6ee150\U900113 \U6ee1100\U900130 ";
//
//price = 2000;
//
//productModel = 5;
//
//productName = "\U6052\U5927\U51b0\U6cc9";
//
//recoverCount = 11;
//
//saleCount = 99;
//
//shopId = 420;
//
//title = "\U6d77\U8c79\U6c34\U7968";
//
//totalCount = 100;
//
//validTime = "2016-07-28 00:00";

@property(nonatomic,copy)NSString *description;
@property(nonatomic,copy)NSString *endTime;
@property(nonatomic,copy)NSString *iconName;
@property(nonatomic,assign)int id;
@property(nonatomic,assign)int inventoryCount;
@property(nonatomic,copy)NSArray *preferentialStrategyModels;
@property(nonatomic,copy)NSString *preferentialStrategyStr;
@property(nonatomic,assign)CGFloat price;
@property(nonatomic,assign)int productModel;
@property(nonatomic,copy)NSString *productName;
@property(nonatomic,assign)int recoverCount;
@property(nonatomic,assign)int saleCount;
@property(nonatomic,assign)int shopId;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)int totalCount;
@property(nonatomic,copy)NSString *validTime;

@end
