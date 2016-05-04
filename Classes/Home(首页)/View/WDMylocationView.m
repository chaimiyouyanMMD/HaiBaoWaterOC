//
//  WDMylocationView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/30.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDMylocationView.h"
@interface WDMylocationView ()
@property(nonatomic,weak)UILabel *locaTitleLabel;
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UIImageView *arrowIcon;
@end
@implementation WDMylocationView
-(instancetype)init
{
    if (self =[super init]) {
        self.backgroundColor = [UIColor whiteColor];
        /**
         * iconView
         */
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"icon_location_blue"];
        self.iconView = iconView;
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(13, 17));
        }];
        
        /**
         *  locaTitleLabel
         */
        UILabel *locaTitleLabel = [[UILabel alloc]init];
        locaTitleLabel.text = @"送水位置:";
        locaTitleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        locaTitleLabel.font = [UIFont systemFontOfSize:14];
        [locaTitleLabel sizeToFit];
        self.locaTitleLabel = locaTitleLabel;
        [self addSubview:locaTitleLabel];
        [locaTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        /**
         *  locaLabel
         */
        UIButton *locaBtn = [[UIButton alloc]init];
        locaBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [locaBtn setTitle:@"正在获取位置信息" forState:UIControlStateNormal];
        [locaBtn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
        locaBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [locaBtn sizeToFit];
        self.locaBtn = locaBtn;
        [self addSubview:locaBtn];
        [locaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(98);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.mas_equalTo(-26);
            make.height.mas_equalTo(44);
        }];
        
        /**
         * arrowIcon
         */
        UIImageView *arrowIcon = [[UIImageView alloc]init];
        arrowIcon.image = [UIImage imageNamed:@"btn_right_arrow"];
        self.arrowIcon = arrowIcon;
        [self addSubview:arrowIcon];
        [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(8, 12));
        }];


    }
    return self;
}

@end
