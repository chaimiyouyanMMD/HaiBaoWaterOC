//
//  WDMerchantDetailModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDMerchantDetailModel : NSObject
@property(nonatomic,copy)NSString *big_image;
@property(nonatomic,copy)NSString *deliveryScope;
@property(nonatomic,assign)CGFloat discount;
@property(nonatomic,assign)int favourite;
@property(nonatomic,assign)int isFavourite;
@property(nonatomic,assign)int itemCount;
@property(nonatomic,copy)NSArray *otherShop;
@property(nonatomic,copy)NSString *promotionActTitle;
@property(nonatomic,copy)NSArray *reviewItemList;
@property(nonatomic,copy)NSString *shopAddress;
@property(nonatomic,copy)NSString *shopCount;
@property(nonatomic,copy)NSString *shopTelephone;
@property(nonatomic,copy)NSString *summary;
@property(nonatomic,copy)NSString *telphone;


@end
