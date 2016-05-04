//
//  WDShopNameView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/30.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDShopNameView.h"
#import "WDStar.h"

@implementation WDShopNameView
-(instancetype)init{
    if (self = [super init]) {
        /**
         *  商店名字
         */
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"乐百氏水站";
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:14];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        /**
         *  分数
         */
        UILabel *scoreLabel = [[UILabel alloc]init];
        scoreLabel.text = @"7分";
        scoreLabel.textColor = [UIColor colorWithHexString:@"777777"];
        scoreLabel.font = [UIFont systemFontOfSize:14];
        [scoreLabel sizeToFit];
        self.scoreLabel = scoreLabel;
        [self addSubview:scoreLabel];
        [scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        
        WDStar *star = [[WDStar alloc] init];
        star.isSelect = NO;
        star.font_size = 20;
        [self addSubview:star];
        [star mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(scoreLabel.mas_left).offset(-6);
            make.centerY.mas_equalTo(self.mas_centerY).offset(-3);
            make.size.mas_equalTo(CGSizeMake(100, 20));
        }];
    }
    return self;
}
@end
