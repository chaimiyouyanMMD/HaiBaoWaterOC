//
//  WDFindPasswordFootView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/30.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDFindPasswordFootView.h"
#import "WDFindPasswordView.h"

@implementation WDFindPasswordFootView
-(instancetype)init
{
    if (self = [super init]) {
        /**
         *  passwordView
         */
        WDFindPasswordView *passwordView = [[WDFindPasswordView alloc]init];
        self.passwordView = passwordView;
        [self addSubview:passwordView];
        [passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(12);
            make.height.mas_equalTo(176);
        }];
        
        // 登录
        UIButton *finishBtn = [[UIButton alloc]init];
        [finishBtn setTitle:@"登录" forState:UIControlStateNormal];
        [finishBtn setBackgroundImage:[UIImage imageNamed:@"bg_blue"] forState:UIControlStateNormal];
        [finishBtn setBackgroundImage:[UIImage imageNamed:@"btn_gray"] forState:UIControlStateDisabled];
        [finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        finishBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [finishBtn sizeToFit];
        finishBtn.enabled = NO;
        self.finishBtn = finishBtn;
        [self addSubview:finishBtn];
        [finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(passwordView.mas_bottom).offset(12);
            make.left.mas_equalTo(12);
            make.right.mas_equalTo(-12);
        }];
        

        
    }
    return self;
}


@end
