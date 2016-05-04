//
//  WDButton.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define  Ratio 0.7
#import "WDButton.h"

@implementation WDButton
-(instancetype)init
{
    if (self = [super init]) {
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        self.iconView = iconView;
        [self addSubview:iconView];
        
        
        /**
         *  title
         */
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = [UIColor colorWithHexString:@"666666"];
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.mas_equalTo(0);
        make.height.mas_equalTo(self.frame.size.height * Ratio );
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.bottom.right.mas_equalTo(0);
        make.top.mas_equalTo(self.iconView.mas_bottom).offset(0);
    }];

}
@end
