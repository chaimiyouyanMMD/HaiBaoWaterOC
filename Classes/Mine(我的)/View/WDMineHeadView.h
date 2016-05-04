//
//  WDMineHeadView.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WDMineInfoView,WDAllOrderView;
@interface WDMineHeadView : UIView
@property(nonatomic,weak)WDMineInfoView *infoView;
@property(nonatomic,weak)WDAllOrderView *allOrder;
@end
