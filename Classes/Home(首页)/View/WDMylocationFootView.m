//
//  WDMylocationFootView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/30.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDMylocationFootView.h"
#import "WDMylocationView.h"
@implementation WDMylocationFootView
-(instancetype)init{
    if (self = [super init]) {
        WDMylocationView *locaView = [[WDMylocationView alloc]init];
        self.locaView = locaView;
        [self addSubview:locaView];
        [locaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
        
        UIButton *buyBtn = [[UIButton alloc]init];
        [buyBtn setTitle:@"我要订水" forState:UIControlStateNormal];
        [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buyBtn setBackgroundImage:[UIImage imageNamed:@"bg_blue"] forState:UIControlStateNormal];
        buyBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [buyBtn sizeToFit];
        self.buyBtn = buyBtn;
        [self addSubview:buyBtn];
        [buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(locaView.mas_bottom).offset(12);
            make.right.mas_equalTo(-12);
            make.left.mas_equalTo(12);
            make.height.mas_equalTo(44);
        }];
    }
    return self;
}

@end
