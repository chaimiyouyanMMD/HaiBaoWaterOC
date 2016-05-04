//
//  WDWaterStationProductCell.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/6.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WDProductListModel;
@interface WDWaterStationProductCell : UITableViewCell
@property(nonatomic,strong)WDProductListModel *model;
@property(nonatomic,copy)void (^cellShopingCarBlock)(WDProductListModel *productM);
@end
