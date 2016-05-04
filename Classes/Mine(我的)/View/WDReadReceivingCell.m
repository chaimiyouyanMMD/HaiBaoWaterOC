//
//  WDReadReceivingCell.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/12.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDReadReceivingCell.h"

@interface WDReadReceivingCell ()
@property(nonatomic,weak)UIView *bgView;
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;
@property(nonatomic,weak)UILabel *pricelLabel;
@property(nonatomic,weak)UILabel *numLable;

@end
@implementation WDReadReceivingCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *bgView = [[UIView alloc]init];
        bgView.layer.borderWidth = 1;
        bgView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithHexString:@"f5f5f5"]);
        bgView.backgroundColor = [UIColor whiteColor];
        self.bgView = bgView;
        [self.contentView addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(-0.5);
            make.right.mas_equalTo(0.5);
            make.top.mas_equalTo(-0.5);
            make.bottom.mas_equalTo(0.5);
        }];
        
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"product_default"];
        self.iconView = iconView;
        [self.contentView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake(80, 80));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"乐百氏";
        titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(iconView.mas_top).offset(4);
        
        }];
        
        UILabel *subTitleLabel = [[UILabel alloc]init];
        subTitleLabel.text = @"买10送2";
        subTitleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        subTitleLabel.font = [UIFont systemFontOfSize:13];
        self.subTitleLabel = subTitleLabel;
        [self.contentView addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(titleLabel.mas_bottom).offset(6);
            
        }];
        
        
        UILabel *pricelLabel = [[UILabel alloc]init];
        pricelLabel.text = @"￥23.00";
        pricelLabel.textColor = [UIColor colorWithHexString:@"333333"];
        pricelLabel.font = [UIFont systemFontOfSize:13];
        self.pricelLabel = pricelLabel;
        [self.contentView addSubview:pricelLabel];
        [pricelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(subTitleLabel.mas_bottom).offset(6);
            
        }];
        
        UILabel *numLable = [[UILabel alloc]init];
        numLable.text = @"x 2";
        numLable.textColor = [UIColor colorWithHexString:@"333333"];
        numLable.font = [UIFont systemFontOfSize:12];
        self.numLable = numLable;
        [self.contentView addSubview:numLable];
        [numLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(pricelLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(pricelLabel.mas_centerY);
        }];
        
    }
    return  self;
}

@end
