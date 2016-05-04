//
//  WDConfirmOrderAddrView.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/9.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface WDNoAddrView : UIView


@end
@interface WDAddrView : UIView


@end
@class WDDefaultAddressModel,WDDistributionView;
@interface WDConfirmOrderAddrView : UIView
@property(nonatomic,weak)WDNoAddrView *noAddrView;
@property(nonatomic,weak)WDAddrView *addrView;
@property(nonatomic,weak)WDDistributionView *distributionView;
@property(nonatomic,copy)WDDefaultAddressModel *addrM;
@end
