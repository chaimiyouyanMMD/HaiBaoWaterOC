//
//  WDSubShopCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/8.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDSubShopCell.h"
#import "WDSubShopModel.h"
#import "UIImageView+WebCache.h"
@interface WDSubShopCell ()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UIImageView *addrIcon;
@property(nonatomic,weak)UILabel *addrLabel;
@property(nonatomic,weak)UILabel*distanceLabel;
@end
@implementation WDSubShopCell
-(void)setSubShopM:(WDSubShopModel *)subShopM
{
    _subShopM = subShopM;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:subShopM.smallImage] placeholderImage:[UIImage imageNamed:@""]];
    self.nameLabel.text = subShopM.shopName;
    self.addrLabel.text = subShopM.address;
    self.distanceLabel.text = [NSString stringWithFormat:@"%.2f米",subShopM.distance];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         * iconView
         */
        UIImageView *iconView = [[UIImageView alloc]init];
        self.iconView = iconView;
        [self.contentView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        /**
         *  name
         */
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:14];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(iconView.mas_top).offset(6);
            
        }];
        
        /**
         * addrIcon
         */
        UIImageView *addrIcon = [[UIImageView alloc]init];
        addrIcon.image = [UIImage imageNamed:@"icon_location_que"];
        self.addrIcon = addrIcon;
        [self addSubview:addrIcon];
        [addrIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.bottom.mas_equalTo(iconView.mas_bottom).offset(-6);
            make.size.mas_equalTo(CGSizeMake(12, 15));
        }];
        
        /**
         *  distanceLabel
         */
        UILabel *distanceLabel = [[UILabel alloc]init];
        distanceLabel.textColor = [UIColor colorWithHexString:@"777777"];
        distanceLabel.font = [UIFont systemFontOfSize:13];
        [distanceLabel sizeToFit];
        self.distanceLabel = distanceLabel;
        [self addSubview:distanceLabel];
        [distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(addrIcon.mas_centerY);
            
        }];
        

        
        /**
         *  addrLabel
         */
        UILabel *addrLabel = [[UILabel alloc]init];
        addrLabel.textColor = [UIColor colorWithHexString:@"777777"];
        addrLabel.font = [UIFont systemFontOfSize:13];
        [addrLabel sizeToFit];
        self.addrLabel = addrLabel;
        [self addSubview:addrLabel];
        [addrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(addrIcon.mas_centerY);
            make.left.mas_equalTo(addrIcon.mas_right).offset(6);
            make.right.mas_lessThanOrEqualTo(distanceLabel.mas_left).offset(-6);
        }];
        
        
      
    }
    return self;
}
@end
