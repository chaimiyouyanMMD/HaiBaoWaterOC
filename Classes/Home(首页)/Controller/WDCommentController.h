//
//  WDCommentController.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WDShopListModel,WDProductInfoModel;
@interface WDCommentController : UITableViewController
@property(nonatomic,strong)WDShopListModel *shopModel;
@property(nonatomic,strong)WDProductInfoModel *productInfoModel;

@end
