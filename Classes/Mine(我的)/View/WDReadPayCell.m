//
//  WDReadPayCell.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/12.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDReadPayCell.h"
#import "WDReadPayHeadView.h"
#import "WDReadPayFoootView.h"


@interface WDReadPayCell ()
@property(nonatomic,weak)WDReadPayHeadView *headView;
@property(nonatomic,weak)WDReadPayFoootView *footView;
@property(nonatomic,weak)UIScrollView *imagesView;
@end

@implementation WDReadPayCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
        WDReadPayHeadView *headView = [[WDReadPayHeadView alloc]init];
        self.headView = headView;
        [self.contentView addSubview:headView];
        [headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
        
        UIScrollView *imagesView = [[UIScrollView alloc]init];
        imagesView.backgroundColor = [UIColor whiteColor];
        self.imagesView = imagesView;
        [self addSubview:imagesView];
        [imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(headView.mas_bottom).offset(1);
            make.height.mas_equalTo(80);
        }];
        
        
        WDReadPayFoootView *footView = [[WDReadPayFoootView alloc]init];
        self.footView = footView;
        [self.contentView addSubview:footView];
        [footView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(imagesView.mas_bottom).offset(1);
            make.height.mas_equalTo(44);
        }];
    }
    return self;
}
@end
