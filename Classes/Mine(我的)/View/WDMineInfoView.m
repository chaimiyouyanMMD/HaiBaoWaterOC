//
//  WDMineInfoView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDMineInfoView.h"
@interface WDMineInfoView()
@property(nonatomic,weak)UIImageView *arrowIcon;
@end
@implementation WDMineInfoView
-(instancetype)init
{
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"profile_img"];
        self.iconView = iconView;
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.bottom.mas_equalTo(-12);
        }];
        
        /**
         *  name
         */
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"任蕊芳";
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:15];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(iconView.mas_top).offset(6);
        }];
        
        /**
         *  noLabel
         */
        UILabel *noLabel = [[UILabel alloc]init];
        noLabel.text = @"海豹队员编号:3322222";
        noLabel.textColor = [UIColor colorWithHexString:@"999999"];
        noLabel.font = [UIFont systemFontOfSize:12];
        [noLabel sizeToFit];
        self.noLabel = noLabel;
        [self addSubview:noLabel];
        [noLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.bottom.mas_equalTo(iconView.mas_bottom).offset(-6);
        }];
        
        /**
         * 箭头
         */
        UIImageView *arrowIcon = [[UIImageView alloc]init];
        arrowIcon.image = [UIImage imageNamed:@"btn_right_arrow"];
        self.arrowIcon = arrowIcon;
        [self addSubview:arrowIcon];
        [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(8, 12));
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        }];
    }
    return self;
}

@end
