//
//  WDUserIconView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/29.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDUserIconView.h"

@implementation WDUserIconView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        /**
         *  title
         */
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"头像";
        titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        titleLabel.font = [UIFont systemFontOfSize:15];
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        /**
         * arrow
         */
        UIImageView *arrowView = [[UIImageView alloc]init];
        arrowView.image = [UIImage imageNamed:@"btn_right_arrow"];
        self.arrowView = arrowView;
        [self addSubview:arrowView];
        [arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(8, 12));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.mas_equalTo(-12);
        }];
        
        /**
         * 头像
         */
        UIButton *iconView = [[UIButton alloc]init];
        [iconView setImage:[UIImage imageNamed:@"profile_img"] forState:UIControlStateNormal];
        self.iconView = iconView;
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.right.mas_equalTo(self.arrowView.mas_left).offset(-6);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];

    }
    return self;
}
@end
