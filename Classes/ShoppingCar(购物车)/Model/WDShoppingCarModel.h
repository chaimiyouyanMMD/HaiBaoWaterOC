//
//  WDShoppingCarModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/5.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDShoppingCarModel : NSObject
@property(nonatomic,copy)NSString *shopName;
@property(nonatomic,assign)int shoppingCartId;

@property(nonatomic,assign)CGFloat smallMoney;

@property(nonatomic,copy)NSString *shopId;

@property(nonatomic,strong)NSArray *itemList;

@end
