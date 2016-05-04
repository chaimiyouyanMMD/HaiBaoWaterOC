//
//  WDDetailCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDDetailCell.h"
#import "WDDetailCellModel.h"
@interface WDDetailCell ()
@property(nonatomic,weak)UILabel *nameLabel;
// 促销
@property(nonatomic,weak)UIButton *promotionBtn;
@property(nonatomic,weak)UILabel *subNameLabel;
@property(nonatomic,weak)UILabel *symbolLabel;
@property(nonatomic,weak)UILabel *priceLabel;
@property(nonatomic,weak)UILabel *originalTitleLabel;
@property(nonatomic,weak)UILabel *originalLabel;
// 库存量
@property(nonatomic,weak)UILabel *stockLabel;
@property(nonatomic,weak)UIView *line;
// 水票
@property(nonatomic,weak)UIButton *ticketBtn;
// 快递
@property(nonatomic,weak)UIButton *distributionBtn;
// 已售
@property(nonatomic,weak)UIButton *numBtn;


@end
@implementation WDDetailCell
-(void)setModel:(WDDetailCellModel *)model
{
    self.nameLabel.text = model.name;
    [self.promotionBtn setTitle:model.promotion forState:UIControlStateNormal];
    self.subNameLabel.text = model.subName;
    self.priceLabel.text = model.price;
    self.originalLabel.text = model.originalPrice;
    [self.numBtn setTitle:model.saleCount forState:UIControlStateNormal];
    self.stockLabel.text = model.stock;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  名字
         */
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"海豹水票";
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:15];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self.contentView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(12);
        }];
        
        // 促销
        UIButton *promotionBtn = [[UIButton alloc]init];
        [promotionBtn setTitle:@"促销" forState:UIControlStateNormal];
        [promotionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [promotionBtn setBackgroundImage:[UIImage imageNamed:@"btn_redBg"] forState:UIControlStateNormal];
        promotionBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [promotionBtn sizeToFit];
        self.promotionBtn = promotionBtn;
        [self.contentView addSubview:promotionBtn];
        [promotionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(12);
        }];
        
        /**
         *  名字
         */
        UILabel *subNameLabel = [[UILabel alloc]init];
        subNameLabel.text = @"乐百氏桶装水18.9L";
        subNameLabel.textColor = [UIColor colorWithHexString:@"777777"];
        subNameLabel.font = [UIFont systemFontOfSize:13];
        [subNameLabel sizeToFit];
        self.subNameLabel = subNameLabel;
        [self.contentView addSubview:subNameLabel];
        [subNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(promotionBtn.mas_centerY);
            make.left.mas_equalTo(promotionBtn.mas_right).offset(6);
            make.right.mas_lessThanOrEqualTo(-12);
        }];
        
        
        /**
         *  价格
         */
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.text = @"23.00";
        priceLabel.textColor = [UIColor redColor];
        priceLabel.font = [UIFont systemFontOfSize:16];
        [priceLabel sizeToFit];
        self.priceLabel = priceLabel;
        [self.contentView addSubview:priceLabel];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(26);
            make.top.mas_equalTo(promotionBtn.mas_bottom).offset(12);
        }];
        
        
        /**
         *  价格
         */
        UILabel *symbolLabel = [[UILabel alloc]init];
        symbolLabel.text = @"￥";
        symbolLabel.textColor = [UIColor colorWithHexString:@"333333"];
        symbolLabel.font = [UIFont systemFontOfSize:13];
        [symbolLabel sizeToFit];
        self.symbolLabel = symbolLabel;
        [self.contentView addSubview:symbolLabel];
        [symbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(priceLabel.mas_left).offset(-2);
            make.bottom.mas_equalTo(priceLabel.mas_bottom).offset(0);
        }];
        
        /**
         *  价格
         */
        UILabel *stockLabel = [[UILabel alloc]init];
        stockLabel.text = @"库存:有现货";
        stockLabel.textColor = [UIColor colorWithHexString:@"999999"];
        stockLabel.font = [UIFont systemFontOfSize:13];
        [stockLabel sizeToFit];
        self.stockLabel = stockLabel;
        [self.contentView addSubview:stockLabel];
        [stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(priceLabel.mas_centerY);
        }];
        
        /**
         *  价格
         */
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor colorWithHexString:@"d1d1d1"];
        self.line = line;
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(priceLabel.mas_bottom).offset(12);
        }];


        // 促销
        UIButton *ticketBtn = [[UIButton alloc]init];
        [ticketBtn setTitle:@"水票:可抵用" forState:UIControlStateNormal];
        [ticketBtn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
        [ticketBtn setImage:[UIImage imageNamed:@"icon_duihao_blue"] forState:UIControlStateNormal];
        ticketBtn.contentMode = UIViewContentModeScaleAspectFit;
        ticketBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [ticketBtn sizeToFit];
        self.ticketBtn = ticketBtn;
        [self.contentView addSubview:ticketBtn];
        [ticketBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(line.mas_bottom).offset(12);
        }];
        
        // 快递
        UIButton *distributionBtn = [[UIButton alloc]init];
        [distributionBtn setTitle:@"快递:0.00" forState:UIControlStateNormal];
        [distributionBtn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
        [distributionBtn setImage:[UIImage imageNamed:@"icon_duihao_blue"] forState:UIControlStateNormal];
        distributionBtn.contentMode = UIViewContentModeScaleAspectFit;
        distributionBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [distributionBtn sizeToFit];
        self.distributionBtn = distributionBtn;
        [self.contentView addSubview:distributionBtn];
        [distributionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ticketBtn.mas_right).offset(0);
            make.centerY.mas_equalTo(ticketBtn.mas_centerY);
            make.width.mas_equalTo(ticketBtn.mas_width);
        }];
        
        // 促销
        UIButton *numBtn = [[UIButton alloc]init];
        [numBtn setTitle:@"已售320" forState:UIControlStateNormal];
        [numBtn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
        [numBtn setImage:[UIImage imageNamed:@"icon_duihao_blue"] forState:UIControlStateNormal];
        numBtn.contentMode = UIViewContentModeScaleAspectFit;
        numBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [numBtn sizeToFit];
        self.numBtn = numBtn;
        [self.contentView addSubview:numBtn];
        [numBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(distributionBtn.mas_right).offset(0);
            make.centerY.mas_equalTo(distributionBtn.mas_centerY);
            make.width.mas_equalTo(distributionBtn.mas_width);
            make.right.mas_equalTo(0);
        }];
        
    }
    return self;
}
@end
@interface WDDetailServiceCell ()
@property(nonatomic,weak)UILabel *titelLabel;
@property(nonatomic,weak)UIButton *activityBtn;
@property(nonatomic,weak)UILabel *contentLabel;


@end
@implementation WDDetailServiceCell
-(void)setModel:(WDDetailServiceCellModel *)model
{
    self.titelLabel.text = model.title;
    [self.activityBtn setTitle:model.activity forState:UIControlStateNormal];
    self.contentLabel.text  = model.content;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        /**
         *  名字
         */
        UILabel *titelLabel = [[UILabel alloc]init];
        titelLabel.text = @"海豹水票";
        titelLabel.textColor = [UIColor colorWithHexString:@"333333"];
        titelLabel.font = [UIFont systemFontOfSize:15];
        [titelLabel sizeToFit];
        self.titelLabel = titelLabel;
        [self.contentView addSubview:titelLabel];
        [titelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(12);
        }];
        
        // 促销
        UIButton *activityBtn = [[UIButton alloc]init];
        [activityBtn setTitle:@"促销" forState:UIControlStateNormal];
        [activityBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [activityBtn setBackgroundImage:[UIImage imageNamed:@"btn_redBg"] forState:UIControlStateNormal];
        activityBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [activityBtn sizeToFit];
        self.activityBtn = activityBtn;
        [self.contentView addSubview:activityBtn];
        [activityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(titelLabel.mas_centerY);
            make.left.mas_equalTo(titelLabel.mas_right).offset(12);
        }];
        
        /**
         *  名字
         */
        UILabel *contentLabel = [[UILabel alloc]init];
        contentLabel.text = @"市区内工作时间2小时送达";
        contentLabel.textColor = [UIColor colorWithHexString:@"777777"];
        contentLabel.font = [UIFont systemFontOfSize:13];
        [contentLabel sizeToFit];
        self.contentLabel = contentLabel;
        [self.contentView addSubview:contentLabel];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(activityBtn.mas_centerY);
            make.left.mas_equalTo(activityBtn.mas_right).offset(12);
            make.right.mas_lessThanOrEqualTo(-12);
        }];
        
      
    }
    return self;
}
@end

@interface WDMerchantDetailCell()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *titelLabel;
@property(nonatomic,weak)UILabel *contentLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;
@property(nonatomic,weak)UIImageView *arrowIcon;
@end
@implementation WDMerchantDetailCell
-(void)setModel:(WDMerchantDetailCellModel *)model
{
    self.iconView.image = [UIImage imageNamed:model.icon];
    self.titelLabel.text = model.title;
    self.contentLabel.text = model.content;
    self.subTitleLabel.text = model.subTitle;
    self.arrowIcon.image = [UIImage imageNamed:model.arrow];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        /**
         * icon
         */
        UIImageView *iconView = [[UIImageView alloc]init];
//        iconView.image = [UIImage imageNamed:@"<#name#>"];
        self.iconView = iconView;
        [self.contentView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        
        /**
         *  名字
         */
        UILabel *titelLabel = [[UILabel alloc]init];
        titelLabel.text = @"海豹水票";
        titelLabel.textColor = [UIColor colorWithHexString:@"333333"];
        titelLabel.font = [UIFont systemFontOfSize:15];
        [titelLabel sizeToFit];
        self.titelLabel = titelLabel;
        [self.contentView addSubview:titelLabel];
        [titelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(20);
            make.top.mas_equalTo(12);
        }];
        
        /**
         *  名字
         */
        UILabel *contentLabel = [[UILabel alloc]init];
        contentLabel.text = @"市区内工作时间2小时送达";
        contentLabel.textColor = [UIColor colorWithHexString:@"777777"];
        contentLabel.font = [UIFont systemFontOfSize:13];
        [contentLabel sizeToFit];
        self.contentLabel = contentLabel;
        [self.contentView addSubview:contentLabel];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(titelLabel.mas_centerY);
            make.left.mas_equalTo(titelLabel.mas_right).offset(20);
            make.right.mas_lessThanOrEqualTo(-20);
        }];
        
        
        /**
         * arrowIcon
         */
        UIImageView *arrowIcon = [[UIImageView alloc]init];
        //        arrowIcon.image = [UIImage imageNamed:@"btn_right_arrow"];
        self.arrowIcon = arrowIcon;
        [self.contentView addSubview:arrowIcon];
        [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.size.mas_equalTo(CGSizeMake(8, 12));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        
        /**
         *  名字
         */
        UILabel *subTitleLabel = [[UILabel alloc]init];
        subTitleLabel.text = @"5";
        subTitleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        subTitleLabel.font = [UIFont systemFontOfSize:15];
        [subTitleLabel sizeToFit];
        self.subTitleLabel = subTitleLabel;
        [self.contentView addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(arrowIcon.mas_left).offset(-6);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        
    }
    return self;
}
@end

@interface WDDetailSummaryCell ()
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UIView *line;
@property(nonatomic,weak)UILabel *contentLabel;
@end
@implementation WDDetailSummaryCell
-(void)setModel:(WDDetailSummaryCellModel *)model
{
    self.contentLabel.text = model.content;
    self.titleLabel.text = model.title;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  titleLabel
         */
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        titleLabel.font = [UIFont systemFontOfSize:15];
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(12);
        }];
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor colorWithHexString:@"d1d1d1"];
        self.line = line;
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
            make.top.mas_equalTo(43);
        }];
        
        /**
         *  contentLabel
         */
        UILabel *contentLabel = [[UILabel alloc]init];
        contentLabel.text = @"";
        contentLabel.numberOfLines = 0;
        contentLabel.textColor = [UIColor colorWithHexString:@"777777"];
        contentLabel.font = [UIFont systemFontOfSize:13];
        [contentLabel sizeToFit];
        self.contentLabel = contentLabel;
        [self.contentView addSubview:contentLabel];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.right.mas_equalTo(-12);
            make.top.mas_equalTo(line.mas_bottom).offset(12);
            make.bottom.mas_equalTo(-12);
        }];

    }
    return self;
}
@end
//@interface WDDetailCell : UITableViewCell
//
//@end
//@implementation WDDetailCell
//
//@end
//@interface WDDetailCell : UITableViewCell
//
//@end
//@implementation WDDetailCell
//
//@end
//@interface WDDetailCell : UITableViewCell
//
//@end
//@implementation WDDetailCell
//
//@end

