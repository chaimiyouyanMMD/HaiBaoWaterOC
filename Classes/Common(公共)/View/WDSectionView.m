//
//  WDSectionView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDSectionView.h"
@interface WDSectionView ()
@property(nonatomic,weak)UIImageView *arrowIcon;
@property(nonatomic,weak)UIView *lineView;
@end
@implementation WDSectionView

-(instancetype)init
{
    if (self =[super init]) {
        UIImageView *iconView = [[UIImageView alloc]init];
        self.iconView = iconView;
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(18, 16));
        }];
        
        /**
         *  title
         */
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = [UIColor colorWithHexString:@"666666"];
        titleLabel.font = [UIFont systemFontOfSize:15];
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.centerY.mas_equalTo(self.mas_centerY);
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
            make.size.mas_equalTo(CGSizeMake(8, 12));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];

        /**
         *  subTitleLabel
         */
        UILabel *subTitleLabel = [[UILabel alloc]init];
        subTitleLabel.textColor = [UIColor colorWithHexString:@"999999"];
        subTitleLabel.font = [UIFont systemFontOfSize:12];
        [subTitleLabel sizeToFit];
        self.subTitleLabel = subTitleLabel;
        [self addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(arrowIcon.mas_left).offset(-6);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        /**
         *  分割线
         */
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        lineView.alpha = 0.2;
        self.lineView = lineView;
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
        
    }
    return self;
}
-(void)settingIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle
{
    self.titleLabel.text = title;
    self.iconView.image = [UIImage imageNamed:icon];
    self.subTitleLabel.text = subTitle;
}
@end
