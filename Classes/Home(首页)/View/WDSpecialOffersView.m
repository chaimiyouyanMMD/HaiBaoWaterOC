//
//  WDSpecialOffersView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/6.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDSpecialOffersView.h"
@interface WDSpecialOffersView()
@property(nonatomic,weak)UIImageView *bgView;
@property(nonatomic,weak)UILabel *symbolLabel;
@property(nonatomic,weak)UILabel *priceLabel;
@property(nonatomic,weak)UILabel *eventLabel;
@property(nonatomic,weak)UILabel *unitLabel;
@property(nonatomic,weak)UIButton *recriveBtn;


@end
@implementation WDSpecialOffersView
-(instancetype)init
{
    if (self = [super init]) {
        
        UIImageView *bgView = [[UIImageView alloc]init];
        bgView.image = [UIImage imageNamed:@"activity_get"];
        self.bgView = bgView;
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.mas_equalTo(0);
        }];
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.text = @"20";
        priceLabel.textColor = [UIColor whiteColor];
        priceLabel.font = [UIFont boldSystemFontOfSize:60];
        [priceLabel sizeToFit];
        self.priceLabel = priceLabel;
        [self addSubview:priceLabel];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(40);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];

        UILabel *symbolLabel = [[UILabel alloc]init];
        symbolLabel.text = @"￥";
        symbolLabel.textColor = [UIColor whiteColor];
        symbolLabel.font = [UIFont boldSystemFontOfSize:15];
        [symbolLabel sizeToFit];
        self.symbolLabel = symbolLabel;
        [self addSubview:symbolLabel];
        [symbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(priceLabel.mas_left).offset(-4);
            make.bottom.mas_equalTo(priceLabel.mas_bottom).offset(-12);
        
        }];
        
        UILabel *unitLabel = [[UILabel alloc]init];
        unitLabel.text = @"代金劵";
        unitLabel.textColor = [UIColor whiteColor];
        unitLabel.font = [UIFont boldSystemFontOfSize:20];
        [unitLabel sizeToFit];
        self.unitLabel = unitLabel;
        [self addSubview:unitLabel];
        [unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(priceLabel.mas_bottom).offset(-12);
            make.left.mas_equalTo(priceLabel.mas_right).offset(4);
        }];
        
        
        UILabel *eventLabel = [[UILabel alloc]init];
        eventLabel.text = @"满100元送10元";
        eventLabel.textColor = [UIColor whiteColor];
        eventLabel.font = [UIFont boldSystemFontOfSize:15];
        [eventLabel sizeToFit];
        self.eventLabel = eventLabel;
        [self addSubview:eventLabel];
        [eventLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(priceLabel.mas_top);
            make.left.mas_equalTo(priceLabel.mas_right).offset(4);
        }];
        
        UIButton *recriveBtn = [[UIButton alloc]init];
        [recriveBtn setTitle:@"领取" forState:UIControlStateNormal];
        [recriveBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        recriveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [recriveBtn sizeToFit];
        self.recriveBtn = recriveBtn;
        [self addSubview:recriveBtn];
        [recriveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-24);
            make.centerY.mas_equalTo(priceLabel.mas_centerY);
        }];

    }
    return self;
}
@end
