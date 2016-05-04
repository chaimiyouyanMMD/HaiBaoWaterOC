//
//  WDOrderDetailCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/20.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDOrderDetailCell.h"

@interface WDOrderDetailCellHeadView ()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@end
@implementation WDOrderDetailCellHeadView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"icon_house"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        self.iconView = iconView;
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.left.mas_equalTo(12);
        }];
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"乐百氏水站";
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:15];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.centerY.mas_equalTo(iconView.mas_centerY);
        }];
        
    }
    return self;
}
@end
@interface WDOrderDetailCell ()
@property(nonatomic,weak)UIView *bgView;
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;
@property(nonatomic,weak)UILabel *priceLabel;
@property(nonatomic,weak)UILabel *numLable;
@end
@implementation WDOrderDetailCell
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
        
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"product_default"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        self.iconView = iconView;
        [self.contentView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(90, 90));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.left.mas_equalTo(12);
        }];
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"乐百氏桶装水";
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:15];
        self.nameLabel = nameLabel;
        [self.contentView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(iconView.mas_top).offset(8);
        }];
        
        
        UILabel *subTitleLabel = [[UILabel alloc]init];
        subTitleLabel.text = @"买10送1";
        subTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        subTitleLabel.font = [UIFont systemFontOfSize:13];
        self.subTitleLabel = subTitleLabel;
        [self.contentView addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(8);
        }];
        
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.text = @"￥23.00";
        priceLabel.textColor = [UIColor colorWithHexString:@"777777"];
        priceLabel.font = [UIFont systemFontOfSize:13];
        self.priceLabel = priceLabel;
        [self.contentView addSubview:priceLabel];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(subTitleLabel.mas_bottom).offset(8);
        }];
        
        UILabel *numLable = [[UILabel alloc]init];
        numLable.text = @"x 1";
        numLable.textColor = [UIColor colorWithHexString:@"777777"];
        numLable.font = [UIFont systemFontOfSize:13];
        self.numLable = numLable;
        [self.contentView addSubview:numLable];
        [numLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(priceLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(priceLabel.mas_centerY);
        }];

        
    }
    return self;
}
@end
