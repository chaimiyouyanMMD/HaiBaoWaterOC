//
//  WDLoginFootView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/29.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDLoginFootView.h"
#import "WDLoginView.h"
@interface WDLoginFootView ()

@end
@implementation WDLoginFootView
-(instancetype)init
{
    if (self = [super init]) {
        
        WDLoginView *loginView = [[WDLoginView alloc]init];
        self.loginView = loginView;
        [self addSubview:loginView];
        [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(12);
            make.height.mas_equalTo(88);
        }];
        
        UIButton *loginBtn = [[UIButton alloc]init];
        [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [loginBtn setTitle:@"登录" forState:UIControlStateDisabled];
        [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [loginBtn setBackgroundImage:[UIImage imageNamed:@"btn_gray"] forState:UIControlStateDisabled];
        [loginBtn setBackgroundImage:[UIImage imageNamed:@"bg_blue"] forState:UIControlStateNormal];
        loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [loginBtn sizeToFit];
        loginBtn.enabled = NO;
        self.loginBtn = loginBtn;
        [self addSubview:loginBtn];
        [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.right.mas_equalTo(-12);
            make.top.mas_equalTo(loginView.mas_bottom).offset(12);
            make.height.mas_equalTo(44);
        }];
        
        UIButton *findPWDBtn = [[UIButton alloc]init];
        [findPWDBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [findPWDBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
        findPWDBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [findPWDBtn sizeToFit];
        self.findPWDBtn = findPWDBtn;
        [self addSubview:findPWDBtn];
        [findPWDBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.top.mas_equalTo(loginBtn.mas_bottom).offset(12);
        }];
    }
    return self;
}
@end
