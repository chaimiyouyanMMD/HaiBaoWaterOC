//
//  WDAllOrderView.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WDButton,WDSectionView;
@interface WDAllOrderView : UIView
@property(nonatomic,weak)WDSectionView *titleView;
@property(nonatomic,weak)WDButton *payBtn;
@property(nonatomic,weak)WDButton *receivingBtn;
@property(nonatomic,weak)WDButton *evaluateBtn;
@property(nonatomic,weak)WDButton *returnBtn;
@end
