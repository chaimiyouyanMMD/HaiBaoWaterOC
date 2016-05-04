//
//  WDShoppingCarFootView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/5.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDShoppingCarFootView.h"
@interface WDShoppingCarFootView ()
@property(nonatomic,weak)UIButton *chooseBtn;
@property(nonatomic,weak)UILabel *totalLabel;

@end
@implementation WDShoppingCarFootView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"4a5156"];
        UIButton *chooseBtn = [[UIButton alloc]init];
        [chooseBtn setTitle:@"全选" forState:UIControlStateNormal];
        [chooseBtn setImage:[UIImage imageNamed:@"icon_duihao_gray"] forState:UIControlStateNormal];
        [chooseBtn setImage:[UIImage imageNamed:@"icon_duihao_red_solid"] forState:UIControlStateSelected];

        [chooseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        chooseBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [chooseBtn sizeToFit];
        self.chooseBtn = chooseBtn;
        [self addSubview:chooseBtn];
        [chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.and.bottom.mas_equalTo(0);
            make.width.mas_equalTo(100);
        }];
        
        
        UILabel *totalLabel = [[UILabel alloc]init];
        totalLabel.text = @"合计:";
        totalLabel.textColor = [UIColor whiteColor];
        totalLabel.font = [UIFont systemFontOfSize:14];
        [totalLabel sizeToFit];
        self.totalLabel = totalLabel;
        [self addSubview:totalLabel];
        [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(chooseBtn.mas_right).offset(6);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        UIButton *clearingBtn = [[UIButton alloc]init];
        [clearingBtn setTitle:@"去结算" forState:UIControlStateNormal];
        clearingBtn.backgroundColor = [UIColor redColor];
        [clearingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        clearingBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [clearingBtn sizeToFit];
        self.clearingBtn = clearingBtn;
        [self addSubview:clearingBtn];
        [clearingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.and.top.and.bottom.mas_equalTo(0);
            make.width.mas_equalTo(90);
        }];
        
        
    }
    return self;
}
@end
