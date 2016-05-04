//
//  WDWaterStationListCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/6.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDWaterStationListCell.h"
#import "WDStar.h"
#import "WDShopListModel.h"
#import "UIImageView+WebCache.h"
@interface WDWaterStationListCell()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)WDStar *star;
@property(nonatomic,weak)UILabel *saleNumLabel;
@property(nonatomic,weak)UIImageView *addrIcon;
@property(nonatomic,weak)UILabel *addrLabel;
@property(nonatomic,weak)UILabel *distanceLabel;
@end
@implementation WDWaterStationListCell
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
        
        WDStar *star = [[WDStar alloc]init];
        star.userInteractionEnabled = NO;
        star.font_size = 20;
        star.full_color = [UIColor colorWithHexString:@"44b4ef"];
        star.empty_color = [UIColor colorWithHexString:@"999999"];
        star.max_star = 10;
        star.isSelect = NO;
        [star sizeToFit];
        self.star = star;
        [self.contentView addSubview:star];
        [star mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(6);
            make.size.mas_equalTo(CGSizeMake(110, 20));
        }];

        
        /**
         *  已售量
         */
        UILabel *saleNumLabel = [[UILabel alloc]init];
        saleNumLabel.text = @"已售332";
        saleNumLabel.textColor = [UIColor colorWithHexString:@"999999"];
        saleNumLabel.font = [UIFont systemFontOfSize:12];
        [saleNumLabel sizeToFit];
        self.saleNumLabel = saleNumLabel;
        [self.contentView addSubview:saleNumLabel];
        [saleNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(star.mas_right).offset(6);
            make.centerY.mas_equalTo(star.mas_centerY);
            make.right.mas_lessThanOrEqualTo(-26);
        }];
        
        
        UIImageView *addrIcon = [[UIImageView alloc]init];
        addrIcon.image = [UIImage imageNamed:@"icon_location_que"];
        self.addrIcon = addrIcon;
        [self.contentView addSubview:addrIcon];
        [addrIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(12, 15));
            make.leading.mas_equalTo(iconView.mas_right).offset(6);
            make.bottom.mas_equalTo(iconView.mas_bottom).offset(-12);
        }];
        
        /**
         *  距离
         */
        UILabel *distanceLabel = [[UILabel alloc]init];
        distanceLabel.textColor = [UIColor colorWithHexString:@"999999"];
        distanceLabel.font = [UIFont systemFontOfSize:12];
        [distanceLabel sizeToFit];
        self.distanceLabel = distanceLabel;
        [self.contentView addSubview:distanceLabel];
        [distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(addrIcon.mas_centerY);
            make.right.mas_equalTo(-12);
        }];
        
        /**
         *  地址
         */
        UILabel *addrLabel = [[UILabel alloc]init];
        addrLabel.textColor = [UIColor colorWithHexString:@"999999"];
        addrLabel.font = [UIFont systemFontOfSize:12];
        [addrLabel sizeToFit];
        self.addrLabel = addrLabel;
        [self.contentView addSubview:addrLabel];
        [addrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(addrIcon.mas_right).offset(4);
            make.centerY.mas_equalTo(addrIcon.mas_centerY);
            make.right.mas_lessThanOrEqualTo(distanceLabel.mas_left).offset(-4);
        }];
    }
    return self;
}

-(void)setShopM:(WDShopListModel *)shopM
{
    _shopM = shopM;
//    NSArray *imageList = shopM.imageList;
//    if (imageList.count) {
//        NSDictionary *urlD = [imageList firstObject];
//        NSString* url = urlD[@"url"];
//        [self.iconView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"station_default"]];
//
//    }
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:shopM.smallImage] placeholderImage:[UIImage imageNamed:@"station_default"]];
   
    self.nameLabel.text = shopM.merchantName;
//    self.star.show_star = shopM.score;
    self.star.show_star = 5;
    self.saleNumLabel.text = [NSString stringWithFormat:@"已售:%d",shopM.monthSailCount];
    self.addrLabel.text = shopM.address;
    self.distanceLabel.text = [NSString stringWithFormat:@"%.2fKM",shopM.distance/1000];
    
}
@end
