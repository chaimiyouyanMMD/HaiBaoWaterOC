//
//  WDMineHeadView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDMineHeadView.h"
#import "WDMineInfoView.h"
#import "WDAllOrderView.h"

@interface WDMineHeadView()

@end
@implementation WDMineHeadView

-(instancetype)init
{
    if (self = [super init]) {
        WDMineInfoView *infoView = [[WDMineInfoView alloc]init];
        infoView.backgroundColor = [UIColor whiteColor];
        self.infoView = infoView;
        [self addSubview:infoView];
        [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(80);
        }];
        
        WDAllOrderView *allOrder = [[WDAllOrderView alloc]init];
        allOrder.backgroundColor = [UIColor whiteColor];
        self.allOrder = allOrder;
        [self addSubview:allOrder];
        [allOrder mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(infoView.mas_bottom).offset(10);
            make.height.mas_equalTo(120);
        }];
    }
    return self;
}

@end
