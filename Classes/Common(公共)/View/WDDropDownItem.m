//
//  WDDropDownItem.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDDropDownItem.h"

@implementation WDDropDownItem
-(instancetype)init
{
    if (self = [super init]) {
        /**
         *  titleLabel
         */
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        titleLabel.font = [UIFont systemFontOfSize:12];
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        /**
         * icon
         */
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"btn_dropdown"];
        iconView.contentMode = UIViewContentModeCenter;
        self.iconView = iconView;
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(14, 8));
            make.left.mas_equalTo(titleLabel.mas_right).offset(4);
        }];

    }
    return self;
}
@end
