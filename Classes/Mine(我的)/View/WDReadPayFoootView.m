//
//  WDReadPayFoootView.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/12.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDReadPayFoootView.h"
@interface WDReadPayFoootView ()
@property(nonatomic,weak)UILabel *totalTitleLabel;
@property(nonatomic,weak)UILabel *totalLabel;
@property(nonatomic,weak)UIButton *payBtn;
@end
@implementation WDReadPayFoootView

-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *totalTitleLabel = [[UILabel alloc]init];
        totalTitleLabel.text = @"实付款:";
        totalTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        totalTitleLabel.font = [UIFont systemFontOfSize:14];
        self.totalTitleLabel = totalTitleLabel;
        [self addSubview:totalTitleLabel];
        [totalTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        
        UILabel *totalLabel = [[UILabel alloc]init];
        totalLabel.text = @"￥23.00";
        totalLabel.textColor = [UIColor redColor];
        totalLabel.font = [UIFont systemFontOfSize:14];
        self.totalLabel = totalLabel;
        [self addSubview:totalLabel];
        [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(totalTitleLabel.mas_right).with.offset(6);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        
        
        UIButton *payBtn = [[UIButton alloc]init];
        [payBtn setBackgroundImage:[UIImage imageNamed:@"home_bg1"] forState:UIControlStateNormal];
        [payBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [payBtn setTitle:@"去支付" forState:UIControlStateNormal];
        payBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:payBtn];
        [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(60, 26));
        }];
    }
    return self;
}

@end
