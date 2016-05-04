//
//  WDPayCell.h
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/16.
//  Copyright © 2016年 huibei. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "WDBaseTableViewCell.h"
@class WDPayModel;
@interface WDPayCellSecHeadView : UIView
@end
@interface WDPayCell : WDBaseTableViewCell
@property(nonatomic,weak)WDPayModel *payM;
@end
