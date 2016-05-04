//
//  WDWaterStationFootBar.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WDButton;
@interface WDProductDetailFootBar : UIControl
// 客服
@property(nonatomic,weak)WDButton *serviceBtn;
// 店铺
@property(nonatomic,weak)WDButton *merchantBtn;
// 收藏
@property(nonatomic,weak)WDButton *collectionBtn;
// 收藏
@property(nonatomic,weak)WDButton *shoppingCarBtn;
// 加入购物车
@property(nonatomic,weak)UIButton *addBtn;

@end



@interface WDTicketDetailFootBar : UIControl
// 客服
@property(nonatomic,weak)WDButton *serviceBtn;
// 收藏
@property(nonatomic,weak)WDButton *collectionBtn;
// 购物车
@property(nonatomic,weak)WDButton *shoppingCarBtn;
// 加入购物车
@property(nonatomic,weak)UIButton *addShoppingCarBtn;

@end
@interface WDWaterStationFootBar : UIControl
// 客服
@property(nonatomic,weak)WDButton *serviceBtn;
// 收藏
@property(nonatomic,weak)WDButton *collectionBtn;
// 购物车
@property(nonatomic,weak)WDButton *shoppingCarBtn;
// 结算
@property(nonatomic,weak)UIButton *clearBtn;
@end
