//
//  WDWaterStationCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/2.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDWaterStationMerchantView.h"
#import "WDStar.h"
#import "WDShopListModel.h"
#import "UIImageView+WebCache.h"
@interface WDWaterStationMerchantView ()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)WDStar *star;
@property(nonatomic,weak)UILabel *reviewNumLabel;
// 水票
@property(nonatomic,weak)UIButton *ticketBtn;
// 代金劵
@property(nonatomic,weak)UIButton *daijinjuanBtn;
// 促销
@property(nonatomic,weak)UIButton *promotionBtn;
// 箭头
@property(nonatomic,weak)UIImageView *arrowIcon;
@end
@implementation WDWaterStationMerchantView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *iconView = [[UIImageView alloc]init];
        self.iconView = iconView;
        [self addSubview:iconView];
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
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(iconView.mas_top).offset(12);
        }];
        
        WDStar *star = [[WDStar alloc]init];
        star.font_size = 20;
        star.full_color = [UIColor colorWithHexString:@"44b4ef"];
        star.isSelect = NO;
        [star sizeToFit];
        self.star = star;
        [self addSubview:star];
        [star mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(6);
            make.size.mas_equalTo(CGSizeMake(110, 20));
        }];
        
        /**
         *  评论数
         */
        UILabel *reviewNumLabel = [[UILabel alloc]init];
        reviewNumLabel.text = @"77条评论";
        reviewNumLabel.textColor = [UIColor colorWithHexString:@"777777"];
        reviewNumLabel.font = [UIFont systemFontOfSize:12];
        [reviewNumLabel sizeToFit];
        self.reviewNumLabel = reviewNumLabel;
        [self addSubview:reviewNumLabel];
        [reviewNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(star.mas_right).offset(6);
            make.centerY.mas_equalTo(star.mas_centerY);
            make.right.mas_lessThanOrEqualTo(-26);
        }];
        
        /**
         * 箭头
         */
        UIImageView *arrowIcon = [[UIImageView alloc]init];
        arrowIcon.image = [UIImage imageNamed:@"btn_right_arrow"];
        self.arrowIcon = arrowIcon;
        [self addSubview:arrowIcon];
        [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(8, 12));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.mas_equalTo(-12);
        }];
        
        /**
         * 水票
         */
        UIButton *ticketBtn = [[UIButton alloc]init];
        [ticketBtn setTitle:@"水票" forState:UIControlStateNormal];
        [ticketBtn setTitleColor:[UIColor colorWithHexString:@"fe801a"] forState:UIControlStateNormal];
//        [ticketBtn setBackgroundImage:[UIImage imageNamed:@"<#name#>"] forState:UIControlStateNormal];
        ticketBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [ticketBtn sizeToFit];
        self.ticketBtn = ticketBtn;
        [self addSubview:ticketBtn];
        [ticketBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.bottom.mas_equalTo(iconView.mas_bottom).offset(-6);
        }];


    }
    return self;
}
-(void)setModel:(WDShopListModel *)model
{
    _model = model;
//    NSArray *images = model.imageList;
//    if (images.count) {
//        NSDictionary *urlD = [images firstObject];
//        NSString *url = urlD[@"url"];
//        [self.iconView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"station_default"]];
//    }
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.smallImage] placeholderImage:[UIImage imageNamed:@"station_default"]];

    self.nameLabel.text = model.merchantName;
    self.star.show_star = model.score;

}
@end
