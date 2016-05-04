//
//  WDTicketCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/2.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDTicketCell.h"
#import "WDWaterTicketModel.h"

@interface WDTicketCell ()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UIButton *commonBtn;
@property(nonatomic,weak)UILabel *saleLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;
@property(nonatomic,weak)UILabel *symbolLabel;
@property(nonatomic,weak)UILabel *priceLabel;
@property(nonatomic,weak)UIButton *activityBtn;
@property(nonatomic,weak)UIImageView *arrowIcon;



@end
@implementation WDTicketCell
-(void)setTicketM:(WDWaterTicketModel *)ticketM
{
    _ticketM = ticketM;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:ticketM.iconName] placeholderImage:[UIImage imageNamed:@"ticket_default_icon"]];
    self.nameLabel.text = ticketM.title;
    self.saleLabel.text = [NSString stringWithFormat:@"已售%d",ticketM.saleCount];
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f",ticketM.price/1000];
    [self.activityBtn setTitle:ticketM.preferentialStrategyStr forState:UIControlStateNormal];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        /**
         * iconView
         */
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"ticket_default_icon"];
        self.iconView = iconView;
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake(90, 90));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        /**
         *  nameLabel
         */
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"乐百士桶装水";
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:15];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(iconView.mas_top).offset(6);
        }];
        
        UIButton *commonBtn = [[UIButton alloc]init];
        [commonBtn setTitle:@"全市通用" forState:UIControlStateNormal];
        [commonBtn setTitleColor:[UIColor colorWithHexString:@"44b4ef"] forState:UIControlStateNormal];
        [commonBtn setBackgroundImage:[UIImage imageNamed:@"home_bg1"] forState:UIControlStateNormal];
        commonBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [commonBtn sizeToFit];
        self.commonBtn = commonBtn;
        [self addSubview:commonBtn];
        [commonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(nameLabel.mas_centerY);
            make.left.mas_equalTo(nameLabel.mas_right).offset(6);
            make.size.mas_equalTo(CGSizeMake(50, 18));
        }];
        
        /**
         *  已售
         */
        UILabel *saleLabel = [[UILabel alloc]init];
        saleLabel.text = @"已售:322";
        saleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        saleLabel.font = [UIFont systemFontOfSize:14];
        [saleLabel sizeToFit];
        self.saleLabel = saleLabel;
        [self addSubview:saleLabel];
        [saleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(nameLabel.mas_centerY);
        }];
        
        /**
         *  subTitleLabel
         */
        UILabel *subTitleLabel = [[UILabel alloc]init];
        subTitleLabel.text = @"哇哈哈 纯净水18.9L";
        subTitleLabel.textColor = [UIColor colorWithHexString:@"999999"];
        subTitleLabel.font = [UIFont systemFontOfSize:12];
        [subTitleLabel sizeToFit];
        self.subTitleLabel = subTitleLabel;
        [self addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(12);
        }];
        
        
        /**
         *  priceLabel
         */
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.text = @"23.00";
        priceLabel.textColor = [UIColor redColor];
        priceLabel.font = [UIFont systemFontOfSize:15];
        [priceLabel sizeToFit];
        self.priceLabel = priceLabel;
        [self addSubview:priceLabel];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(18);
            make.top.mas_equalTo(subTitleLabel.mas_bottom).offset(12);
        }];
        
        /**
         *  name
         */
        UILabel *symbolLabel = [[UILabel alloc]init];
        symbolLabel.text = @"￥";
        symbolLabel.textColor = [UIColor colorWithHexString:@"333333"];
        symbolLabel.font = [UIFont systemFontOfSize:13];
        [symbolLabel sizeToFit];
        self.symbolLabel = symbolLabel;
        [self addSubview:symbolLabel];
        [symbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(priceLabel.mas_left).offset(0);
            make.bottom.mas_equalTo(priceLabel.mas_bottom).offset(1);
        }];
        
        UIButton *activityBtn = [[UIButton alloc]init];
        [activityBtn setTitle:@"买10送1" forState:UIControlStateNormal];
        [activityBtn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
//        [activityBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
        activityBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [activityBtn sizeToFit];
        self.activityBtn = activityBtn;
        [self addSubview:activityBtn];
        [activityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(priceLabel.mas_centerY);
            make.left.mas_equalTo(priceLabel.mas_right).offset(6);
            make.right.mas_lessThanOrEqualTo(-6);
        }];
        
        /**
         * iconView
         */
        UIImageView *arrowIcon = [[UIImageView alloc]init];
        arrowIcon.image = [UIImage imageNamed:@"btn_right_arrow"];
        self.arrowIcon = arrowIcon;
        [self addSubview:arrowIcon];
        [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.size.mas_equalTo(CGSizeMake(8, 12));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        

    }
    return self;
}
@end
