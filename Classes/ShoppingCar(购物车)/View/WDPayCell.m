//
//  WDPayCell.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/16.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDPayCell.h"
#import "WDPayModel.h"
@interface WDPayCellSecHeadView ()
@property(nonatomic,weak)UIView *bgView;

@property(nonatomic,weak)UILabel *titleLabel;
@end
@implementation WDPayCellSecHeadView
-(instancetype)init
{
    if (self = [super init]) {
        
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithHexString:@"f5f5f5"]);
        bgView.layer.borderWidth = 1;
        self.bgView = bgView;
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(-1);
            make.right.mas_equalTo(1);
            make.top.mas_equalTo(-1);
            make.bottom.mas_equalTo(-1);
        }];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"选择支付方式";
        titleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    return self;
}
@end
@interface WDPayCell ()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;
@property(nonatomic,weak)UIButton *selectedBtn;
@end
@implementation WDPayCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        UIImageView *iconView = [[UIImageView alloc]init];
        self.iconView = iconView;
        [self.contentView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.left.mas_offset(12);
        }];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(iconView.mas_top).offset(0);
        }];
        
        UILabel *subTitleLabel = [[UILabel alloc]init];
        subTitleLabel.textColor = [UIColor colorWithHexString:@"999999"];
        self.subTitleLabel = subTitleLabel;
        [self.contentView addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.bottom.mas_equalTo(iconView.mas_bottom).offset(0);
        }];
        
        UIButton *selectedBtn = [[UIButton alloc]init];
        [selectedBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [selectedBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        self.selectedBtn = selectedBtn;
        [self.contentView addSubview:selectedBtn];
        [selectedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.mas_equalTo(-12);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
    }
    return self;
}
-(void)setPayM:(WDPayModel *)payM
{
    self.iconView.image = [UIImage imageNamed:payM.icon];
    self.titleLabel.text = payM.title;
    self.subTitleLabel.text = payM.subTitle;
}
@end
