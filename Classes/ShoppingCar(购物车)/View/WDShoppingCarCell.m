//
//  WDShoppingCarCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/5.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDShoppingCarCell.h"
#import "WDShoppingItemCarModel.h"
#import "UIImageView+WebCache.h"
@interface WDShoppingCarCell ()
@property(nonatomic,weak)UIView *bgView;
@property(nonatomic,weak)UIButton *chooseBtn;
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;
@property(nonatomic,weak)UILabel *priceLabel;
@property(nonatomic,weak)UILabel *numLabel;
// 套餐
@property(nonatomic,weak)UIButton *comboBtn;
@end
@implementation WDShoppingCarCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *bgView = [[UIView alloc]init];
        bgView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithHexString:@"f5f5f5"]);
        bgView.layer.borderWidth = 0.5;
        self.bgView = bgView;
        [self.contentView addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(-0.5);
            make.right.mas_equalTo(0.5);
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
        UIButton *chooseBtn = [[UIButton alloc]init];
        [chooseBtn setBackgroundImage:[UIImage imageNamed:@"icon_duihao_gray"] forState:UIControlStateNormal];
        [chooseBtn setBackgroundImage:[UIImage imageNamed:@"icon_duihao_red_solid"] forState:UIControlStateSelected];
        [chooseBtn sizeToFit];
        self.chooseBtn = chooseBtn;
        [self.contentView addSubview:chooseBtn];
        [chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"ticket_default_icon"];
        self.iconView = iconView;
        [self.contentView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(chooseBtn.mas_right).offset(6);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(90, 90));
        }];
        
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:15];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self.contentView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(iconView.mas_top).offset(6);
        }];
        
        
        UILabel *subTitleLabel = [[UILabel alloc]init];
//        subTitleLabel.text = @"哇哈哈 纯净水18.9L";
        subTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        subTitleLabel.font = [UIFont systemFontOfSize:13];
        [subTitleLabel sizeToFit];
        self.subTitleLabel = subTitleLabel;
        [self.contentView addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(12);
            
        }];
        
       
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.textColor = [UIColor redColor];
        priceLabel.font = [UIFont systemFontOfSize:15];
        [priceLabel sizeToFit];
        self.priceLabel = priceLabel;
        [self.contentView addSubview:priceLabel];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(subTitleLabel.mas_bottom).offset(12);
            
        }];
        
       
        UILabel *numLabel = [[UILabel alloc]init];
        numLabel.textColor = [UIColor colorWithHexString:@"777777"];
        numLabel.font = [UIFont systemFontOfSize:13];
        [numLabel sizeToFit];
        self.numLabel = numLabel;
        [self.contentView addSubview:numLabel];
        [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(priceLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(priceLabel.mas_centerY);
        }];

        UIButton *comboBtn = [[UIButton alloc]init];
        [comboBtn setTitle:@"修改套餐" forState:UIControlStateNormal];
        [comboBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
        [comboBtn setBackgroundImage:[UIImage imageNamed:@"home_bg1"] forState:UIControlStateNormal];
        comboBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [comboBtn sizeToFit];
        self.comboBtn = comboBtn;
        [self.contentView addSubview:comboBtn];
        [comboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(75, 22));
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(priceLabel.mas_centerY);
        }];
    }
    return self;
}
-(void)setModel:(WDShoppingItemCarModel *)model
{
    _model = model;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@""]];
    self.chooseBtn.selected = model.selected;
    self.nameLabel.text = model.productName;
//    self.subTitleLabel.text =
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f",model.price/100];
    self.numLabel.text = [NSString stringWithFormat:@"x %d",model.num];
}
@end
