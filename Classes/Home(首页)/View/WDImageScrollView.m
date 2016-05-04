//
//  WDImageScrollView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/30.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDImageScrollView.h"
#import "WDShopNameView.h"
#import "iCarousel.h"
#import "WDImageScrollModel.h"
#import "WDStar.h"
@interface WDImageScrollView ()
@property(nonatomic,weak)WDShopNameView *shopNameView;
@property(nonatomic,weak)iCarousel *imageSrollView;
@property(nonatomic,weak)UIPageControl *pageControl;
@end
@implementation WDImageScrollView
-(void)setModel:(WDImageScrollModel *)model
{
    self.shopNameView.nameLabel.text = model.shopName;
    self.shopNameView.star.show_star = model.sore;
    self.shopNameView.hidden = model.shopViewHidden;
    self.shopNameView.scoreLabel.text = [NSString stringWithFormat:@"%d分",model.sore];
    self.shopViewHidden = model.shopViewHidden;
}
-(void)setShopViewHidden:(BOOL)shopViewHidden
{
    _shopViewHidden = shopViewHidden;
    if (_shopViewHidden == YES) {
        self.shopNameView.hidden = _shopViewHidden;
        [self.imageSrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
        }];
        [self.shopNameView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        iCarousel *imageSrollView = [[iCarousel alloc]init];
        imageSrollView.backgroundColor = [UIColor redColor];
        self.imageSrollView = imageSrollView;
        [self addSubview:imageSrollView];
        [imageSrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(-44);
        }];
        
        WDShopNameView *shopNameView = [[WDShopNameView alloc]init];
        shopNameView.hidden = NO;
        shopNameView.star.full_color = [UIColor colorWithHexString:@"44a4ef"];
        shopNameView.star.empty_color = [UIColor colorWithHexString:@"d1d1d1"];
        shopNameView.star.isSelect = NO;
        shopNameView.star.font_size = 20;
        shopNameView.backgroundColor = [UIColor whiteColor];
        self.shopNameView = shopNameView;
        [self addSubview:shopNameView];
        [shopNameView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
        
        

        
    }
    return self;
}
@end
