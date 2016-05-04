//
//  WDShoppingCarHeadView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/5.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDShoppingCarHeadView.h"
#import "WDShoppingCarModel.h"

@interface WDShoppingCarHeadView()
@property(nonatomic,weak)UIButton *chooseBtn;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *totalLabel;
//@property(nonatomic,weak)UIView *line;
@end
@implementation WDShoppingCarHeadView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UIButton *chooseBtn = [[UIButton alloc]init];
        [chooseBtn setBackgroundImage:[UIImage imageNamed:@"icon_duihao_gray"] forState:UIControlStateNormal];
        [chooseBtn setBackgroundImage:[UIImage imageNamed:@"icon_duihao_red_solid"] forState:UIControlStateSelected];
        [chooseBtn sizeToFit];
        self.chooseBtn = chooseBtn;
        [self addSubview:chooseBtn];
        [chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
       
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"乐百氏水站";
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:15];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(chooseBtn.mas_right).offset(6);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        UILabel *totalLabel = [[UILabel alloc]init];
        totalLabel.text = @"小计:23.00";
        totalLabel.textColor = [UIColor redColor];
        totalLabel.font = [UIFont systemFontOfSize:15];
        [totalLabel sizeToFit];
        self.totalLabel = totalLabel;
        [self addSubview:totalLabel];
        [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];

    }
    return self;
}

-(void)setModel:(WDShoppingCarModel *)model
{
    _model = model;
    self.nameLabel.text = model.shopName;
    self.totalLabel.text = [NSString stringWithFormat:@"合计:%.2f",model.smallMoney/100];
}
@end
