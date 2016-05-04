//
//  WDMineCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/8.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDMineCell.h"
#import "WDCellModel.h"

@interface WDMineCell ()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;

@end
@implementation WDMineCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@""];
        self.iconView = iconView;
        [self.contentView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(18, 16));
        }];
        
        /**
         *  title
         */
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = [UIColor colorWithHexString:@"666666"];
        titleLabel.font = [UIFont systemFontOfSize:15];
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(12);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            
        }];
        
        /**
         *  subTitle
         */
        UILabel *subTitleLabel = [[UILabel alloc]init];
        subTitleLabel.textColor = [UIColor colorWithHexString:@"666666"];
        subTitleLabel.font = [UIFont systemFontOfSize:15];
        [subTitleLabel sizeToFit];
        self.subTitleLabel = subTitleLabel;
        [self addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            
        }];
    }
    return self;
}
-(void)setCellM:(WDCellModel *)cellM
{
    _cellM = cellM;
    self.titleLabel.text = cellM.title;
    self.subTitleLabel.text = cellM.subTitle;
    self.iconView.image = [UIImage imageNamed:cellM.icon];
    if (cellM.icon == nil || cellM.icon.length == 0) {
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
        }];
    }
    if (cellM.accessoryType != UITableViewCellAccessoryNone) {
        [self.subTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-28);
        }];
    }
    
    
}
@end
