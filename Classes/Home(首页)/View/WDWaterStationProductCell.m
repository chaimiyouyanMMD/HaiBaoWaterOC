//
//  WDWaterStationProductCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/6.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDWaterStationProductCell.h"
#import "WDProductListModel.h"
#import "UIImageView+WebCache.h"
@interface WDWaterStationProductCell()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *priceLabel;
@property(nonatomic,weak)UILabel *symbolLabel;
@property(nonatomic,weak)UILabel *saleNumLabel;
@property(nonatomic,weak)UIButton *shopCarIcon;
@end
@implementation WDWaterStationProductCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *iconView = [[UIImageView alloc]init];
        self.iconView = iconView;
        iconView.userInteractionEnabled = NO;
        [self.contentView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(90, 90));
        }];
        
        /**
         *  水站名字
         */
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
    
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.textColor = [UIColor colorWithHexString:@"999999"];
        priceLabel.font = [UIFont systemFontOfSize:12];
        [priceLabel sizeToFit];
        self.priceLabel = priceLabel;
        [self.contentView addSubview:priceLabel];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(20);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(10);
        }];
        
        
        UILabel *symbolLabel = [[UILabel alloc]init];
        symbolLabel.text = @"￥";
        symbolLabel.textColor = [UIColor colorWithHexString:@"999999"];
        symbolLabel.font = [UIFont systemFontOfSize:12];
        [symbolLabel sizeToFit];
        self.symbolLabel = symbolLabel;
        [self.contentView addSubview:symbolLabel];
        [symbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(priceLabel.mas_left).offset(-4);
            make.bottom.mas_equalTo(priceLabel.mas_bottom);
        }];
        
        /**
         *  已售量
         */
        UILabel *saleNumLabel = [[UILabel alloc]init];
        saleNumLabel.textColor = [UIColor colorWithHexString:@"999999"];
        saleNumLabel.font = [UIFont systemFontOfSize:12];
        [saleNumLabel sizeToFit];
        self.saleNumLabel = saleNumLabel;
        [self.contentView addSubview:saleNumLabel];
        [saleNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(priceLabel.mas_bottom).offset(10);
        }];
        
        
        UIButton *shopCarIcon = [[UIButton alloc]init];
        [shopCarIcon setBackgroundImage:[UIImage imageNamed:@"btn_addshoppingcart"] forState:UIControlStateNormal];
        [shopCarIcon sizeToFit];
        [shopCarIcon addTarget:self action:@selector(shopingCarClick) forControlEvents:UIControlEventTouchUpInside];
        self.shopCarIcon = shopCarIcon;
        [self.contentView addSubview:shopCarIcon];
        [shopCarIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
    }
    return self;
}
-(void)shopingCarClick
{
    if (self.cellShopingCarBlock) {
        self.cellShopingCarBlock(self.model);
    }
}
-(void)setModel:(WDProductListModel *)model
{
    _model = model;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.big_image] placeholderImage:[UIImage imageNamed:@"product_default"]];
    self.nameLabel.text = model.title;
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f",model.price/100];
    self.saleNumLabel.text = [NSString stringWithFormat:@"已售%d",model.salesCnt];
}
@end
