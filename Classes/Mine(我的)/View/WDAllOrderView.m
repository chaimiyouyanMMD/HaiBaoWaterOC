//
//  WDAllOrderView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDAllOrderView.h"
#import "WDButton.h"
#import "WDSectionView.h"

@interface WDAllOrderView ()

@end
@implementation WDAllOrderView
-(instancetype)init
{
    if (self = [super init]) {
        WDSectionView *titleView = [[WDSectionView alloc]init];
        [titleView settingIcon:@"me_icon_order" title:@"订单" subTitle:@"查看全部"];
        self.titleView = titleView;
        [self addSubview:titleView];
        [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
        
        WDButton *payBtn = [[WDButton alloc]init];
        payBtn.iconView.image = [UIImage imageNamed:@"me_icon_daifukuan"];
        payBtn.titleLabel.text = @"待付款";
        self.payBtn = payBtn;
        [self addSubview:payBtn];
        [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(titleView.mas_bottom).offset(10);
            make.bottom.mas_equalTo(-10);
        }];
        
        WDButton *receivingBtn = [[WDButton alloc]init];
        receivingBtn.iconView.image = [UIImage imageNamed:@"me_icon_daishouhuo"];
        receivingBtn.titleLabel.text = @"待收货";
        self.receivingBtn = receivingBtn;
        [self addSubview:receivingBtn];
        [receivingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(payBtn.mas_right);
            make.top.mas_equalTo(titleView.mas_bottom).offset(10);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(payBtn.mas_width);
        }];
        
        WDButton *evaluateBtn = [[WDButton alloc]init];
        evaluateBtn.iconView.image = [UIImage imageNamed:@"me_icon_daipngjia"];
        evaluateBtn.titleLabel.text = @"待评价";
        self.evaluateBtn = evaluateBtn;
        [self addSubview:evaluateBtn];
        [evaluateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(receivingBtn.mas_right);
            make.top.mas_equalTo(titleView.mas_bottom).offset(10);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(receivingBtn.mas_width);
        }];
        
        WDButton *returnBtn = [[WDButton alloc]init];
        returnBtn.iconView.image = [UIImage imageNamed:@"me_icon_tuihuan"];
        returnBtn.titleLabel.text = @"退换";
        self.returnBtn = returnBtn;
        [self addSubview:returnBtn];
        [returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(evaluateBtn.mas_right);
            make.top.mas_equalTo(titleView.mas_bottom).offset(10);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(evaluateBtn.mas_width);
            make.right.mas_equalTo(0);
        }];
    }
    return self;
}

@end
