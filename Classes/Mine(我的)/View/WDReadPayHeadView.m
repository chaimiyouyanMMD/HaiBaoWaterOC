//
//  WDReadPayHeadView.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/12.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDReadPayHeadView.h"
@interface WDReadPayHeadView()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UIButton *payBtn;
@end
@implementation WDReadPayHeadView

-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"icon_house"];
        self.iconView = iconView;
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(12, 15));
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"蓝鲸水站";
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:14];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.centerY.mas_equalTo(iconView.mas_centerY);
        }];
        
        UIButton *payBtn = [[UIButton alloc]init];
        [payBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [payBtn setTitle:@"等待支付" forState:UIControlStateNormal];
        payBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:payBtn];
        [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    return self;
}


@end
