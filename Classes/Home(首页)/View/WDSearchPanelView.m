//
//  WDSearchPanelView.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/13.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDSearchPanelView.h"

@interface WDSearchPanelView ()
@property(nonatomic,weak)UIView *bgView;
@property(nonatomic,weak)UIImageView *iconView;
@end
@implementation WDSearchPanelView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.masksToBounds = YES;
        bgView.layer.cornerRadius = 5;
        self.bgView = bgView;
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.bottom.mas_equalTo(-10);
        }];
        
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"nav_icon_search_gray"];
        self.iconView = iconView;
        [self.bgView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.centerY.mas_equalTo(self.bgView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"请填写送水位置";
        titleLabel.textColor = [UIColor colorWithHexString:@"999999"];
        titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel = titleLabel;
        [self.bgView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(5);
            make.centerY.mas_equalTo(iconView.mas_centerY);
        }];
    }
    return self;
}

@end
