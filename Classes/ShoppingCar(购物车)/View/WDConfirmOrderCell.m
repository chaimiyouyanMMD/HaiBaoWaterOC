//
//  WDConfirmOrderCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/9.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDConfirmOrderCell.h"
#import "WDConfirmOrderFootView.h"
@interface WDShopCellHeadView : UIControl
@property(nonatomic,weak)UIImageView *shopIcon;
@property(nonatomic,weak)UILabel *titleLabel;
@end
@implementation WDShopCellHeadView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *shopIcon = [[UIImageView alloc]init];
        shopIcon.image = [UIImage imageNamed:@"icon_house"];
        self.shopIcon = shopIcon;
        [self addSubview:shopIcon];
        [shopIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.offset(12);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(15, 13));
        }];
        
       
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"lebaishi";
        titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        titleLabel.font = [UIFont systemFontOfSize:14];
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(shopIcon.mas_right).offset(6);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
    }
    return self;
}
@end

@interface WDShopCellBodyView:UIControl
@property(nonatomic,weak)UIView *bgView;
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;
@property(nonatomic,weak)UILabel *priceLabe;
@property(nonatomic,weak)UILabel *numLabel;

@end
@implementation WDShopCellBodyView
-(instancetype)init
{
       if ([super init]) {
        
        UIView *bgView = [[UIView alloc]init];
        bgView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithHexString:@"f5f5f5"]);
        bgView.layer.borderWidth = 0.5;
        self.bgView = bgView;
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(-0.5);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0.5);

        }];

        
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"product_default"];
        self.iconView = iconView;
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
       
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"拉百事";
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:14];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(iconView.mas_top).offset(6);
        }];
        
        
        UILabel *subTitleLabel = [[UILabel alloc]init];
        subTitleLabel.text = @"哇哈哈哈桶装水18.9l";
        subTitleLabel.textColor = [UIColor colorWithHexString:@"77777"];
        subTitleLabel.font = [UIFont systemFontOfSize:12];
        [subTitleLabel sizeToFit];
        self.subTitleLabel = subTitleLabel;
        [self addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(6);
        }];
        
        UILabel *priceLabe = [[UILabel alloc]init];
        priceLabe.text = @"￥23.00";
        priceLabe.textColor = [UIColor colorWithHexString:@"77777"];
        priceLabe.font = [UIFont systemFontOfSize:12];
        [priceLabe sizeToFit];
        self.priceLabe = priceLabe;
        [self addSubview:priceLabe];
        [priceLabe mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.top.mas_equalTo(subTitleLabel.mas_bottom).offset(6);
        }];
        
        UILabel *numLabel = [[UILabel alloc]init];
        numLabel.text = @"x 2";
        numLabel.textColor = [UIColor colorWithHexString:@"77777"];
        numLabel.font = [UIFont systemFontOfSize:12];
        [numLabel sizeToFit];
        self.numLabel = numLabel;
        [self addSubview:numLabel];
        [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(priceLabe.mas_right).offset(6);
            make.centerY.mas_equalTo(priceLabe.mas_centerY).offset(0);
        }];

    }
    return self;
}

@end

@interface WDConfirmOrderCell()
@property(nonatomic,weak)WDShopCellHeadView *headView;
@property(nonatomic,weak)UIView *bodyView;
@property(nonatomic,weak)WDConfirmOrderFootView *footView;
@end
@implementation WDConfirmOrderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        WDShopCellHeadView *headView = [[WDShopCellHeadView alloc]init];
        self.headView = headView;
        [self.contentView addSubview:headView];
        [headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(44);
            
        }];
        
        UIView *bodyView = [[UIView alloc]init];
        self.bodyView = bodyView;
        [self.contentView addSubview:bodyView];
        [bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(headView.mas_bottom).with.offset(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(10);
            
        }];
        
        
        WDConfirmOrderFootView *footView = [[WDConfirmOrderFootView alloc]init];
        self.footView = footView;
        [self.contentView addSubview:footView];
        [footView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(176);
            make.top.mas_equalTo(bodyView.mas_bottom).with.offset(0);
        }];

    }
    return self;
}

@end
