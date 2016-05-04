//
//  WDChooseAddressHeadView.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/13.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDChooseAddressHeadView.h"
#import "WDSearchPanelView.h"

@interface WDChooseAddressHeadView ()
@property(nonatomic,weak)UIButton *homeBtn;
@property(nonatomic,weak)UIButton *companyBtn;
@property(nonatomic,weak)WDSearchPanelView *searchView;
@end
@implementation WDChooseAddressHeadView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
        WDSearchPanelView *searchView = [[WDSearchPanelView alloc]init];
        searchView.titleLabel.text = @"请输入您的送水位置";
        self.searchView = searchView;
        [self addSubview:searchView];
        [searchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        
        UIButton *homeBtn = [[UIButton alloc]init];
        [homeBtn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [homeBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [homeBtn setBackgroundColor:[UIColor whiteColor]];
        [homeBtn setTitle:@"家庭地址" forState:UIControlStateNormal];
        [homeBtn setImage:[UIImage imageNamed:@"icon_home-address"] forState:UIControlStateNormal];
        [homeBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        homeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.homeBtn = homeBtn;
        [self addSubview:homeBtn];
        [homeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(searchView.mas_bottom).offset(0);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(-1);
            make.height.mas_equalTo(55);
        }];
        
        
        UIButton *companyBtn = [[UIButton alloc]init];
        [companyBtn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [companyBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [companyBtn setBackgroundColor:[UIColor whiteColor]];
        [companyBtn setTitle:@"公司地址" forState:UIControlStateNormal];
        [companyBtn setImage:[UIImage imageNamed:@"icon_company-address"] forState:UIControlStateNormal];
        [companyBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        companyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.companyBtn = companyBtn;
        [self addSubview:companyBtn];
        [companyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(searchView.mas_bottom).offset(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-1);
            make.height.mas_equalTo(55);
            make.left.mas_equalTo(homeBtn.mas_right).offset(1);
            make.width.mas_equalTo(homeBtn.mas_width);
        }];
    }
    return self;
}


@end
