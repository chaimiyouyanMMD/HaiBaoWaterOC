//
//  WDProductDetailController.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDRootViewController.h"
@class WDProductListModel,WDShopListModel;
@interface WDProductDetailController : WDRootViewController
@property(nonatomic,assign)int productId;
@property(nonatomic,strong)WDProductListModel *productM;
@property(nonatomic,strong)WDShopListModel *shopModel;

@end
