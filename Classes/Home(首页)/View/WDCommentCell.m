//
//  WDCommentCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDCommentCell.h"
#import "WDStar.h"
#import "WDCommentModel.h"
@implementation WDCommentHeadView
-(instancetype)init
{
    if (self = [super init]) {
        /**
         *  titleLabel
         */
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"商品评论";
        titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        titleLabel.font = [UIFont systemFontOfSize:15];
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        /**
         * arrowView
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
@interface WDCommentCell ()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *accountLabel;
@property(nonatomic,weak)UILabel *timeLabel;
@property(nonatomic,weak)WDStar *star;
@property(nonatomic,weak)UILabel *contentLabel;
@property(nonatomic,weak)UIView *placeHolderView;
@property(nonatomic,weak)UIControl *photosContentView;
@property(nonatomic,strong)NSArray *photos;
@end
@implementation WDCommentCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         * iconView
         */
        UIImageView *iconView = [[UIImageView alloc]init];
//        iconView.image = [UIImage imageNamed:@"<#name#>"];
        self.iconView = iconView;
        [self.contentView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        /**
         *  名字
         */
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"人瑞芳";
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:13];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self.contentView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(12);
        }];
        
        /**
         *  帐号
         */
        UILabel *accountLabel = [[UILabel alloc]init];
        accountLabel.text = @"282828833";
        accountLabel.textColor = [UIColor colorWithHexString:@"777777"];
        accountLabel.font = [UIFont systemFontOfSize:12];
        [accountLabel sizeToFit];
        self.accountLabel = accountLabel;
        [self.contentView addSubview:accountLabel];
        [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(nameLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(nameLabel.mas_centerY);
        }];
        
        /**
         *  评论时间
         */
        UILabel *timeLabel = [[UILabel alloc]init];
        timeLabel.text = @"2016-05-4";
        timeLabel.textColor = [UIColor colorWithHexString:@"777777"];
        timeLabel.font = [UIFont systemFontOfSize:12];
        [timeLabel sizeToFit];
        self.timeLabel = timeLabel;
        [self.contentView addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.top.mas_equalTo(12);
        }];
        
        WDStar *star = [[WDStar alloc]init];
        star.empty_color = [UIColor colorWithHexString:@"44b4ef"];
        star.full_color = [UIColor colorWithHexString:@"999999"];
        star.font_size = 20;
        star.isSelect = NO;
        self.star = star;
        [self.contentView addSubview:star];
        [star mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(nameLabel.mas_left).offset(0);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(6);
            make.size.mas_equalTo(CGSizeMake(110, 20));
        }];
        
        /**
         *  评论内容
         */
        UILabel *contentLabel = [[UILabel alloc]init];
        contentLabel.text = @"";
        contentLabel.textColor = [UIColor colorWithHexString:@"777777"];
        contentLabel.font = [UIFont systemFontOfSize:12];
        [contentLabel sizeToFit];
        contentLabel.numberOfLines = 0;
        self.contentLabel = contentLabel;
        [self addSubview:contentLabel];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(star.mas_bottom).offset(6);
            make.right.mas_equalTo(-12);
        }];
        
        UIView *placeHolderView = [[UIView alloc]init];
        self.placeHolderView = placeHolderView;
        [self.contentView addSubview:placeHolderView];
        [placeHolderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(12);
            make.top.mas_equalTo(contentLabel.mas_bottom).offset(4);
            make.size.mas_equalTo(CGSizeMake(1, 1));
            make.bottom.mas_equalTo(0);
        }];
        
        UIControl *photosContentView = [[UIControl alloc]init];
        self.photosContentView = photosContentView;
        [self.contentView addSubview:photosContentView];
        [photosContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(placeHolderView.mas_bottom).offset(6);
            make.right.mas_equalTo(-12);
            make.bottom.mas_equalTo(-6);
        }];

    }
    return self;
}
@end
