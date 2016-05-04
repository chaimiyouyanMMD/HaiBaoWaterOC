//
//  WDRegisterFootView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/30.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDRegisterFootView.h"
#import "WDRegisterView.h"
@interface WDRegisterFootView()

@property(nonatomic,weak)UIButton *chooseBtn;


@end
@implementation WDRegisterFootView
-(instancetype)init
{
    if (self = [super init]) {
        /**
         *  registerView
         */
        WDRegisterView *registerView = [[WDRegisterView alloc]init];
        self.registerView = registerView;
        [self addSubview:registerView];
        [registerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(12);
            make.height.mas_equalTo(132);
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
            make.top.mas_equalTo(registerView.mas_bottom).offset(12);
            make.left.mas_equalTo(12);
            make.right.mas_equalTo(-12);
        }];
        
        // 阅读
        UIButton *chooseBtn = [[UIButton alloc]init];
        chooseBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [chooseBtn setTitle:@"我已阅读并同意" forState:UIControlStateNormal];
        [chooseBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
        [chooseBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [chooseBtn setImage:[UIImage imageNamed:@"setting_displayPassward"] forState:UIControlStateNormal];
        chooseBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.chooseBtn = chooseBtn;
        [self addSubview:chooseBtn];
        [chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(finishBtn.mas_bottom).offset(12);
            make.left.mas_equalTo(0);
        }];
        
        UIButton *protocolBtn = [[UIButton alloc]init];
        protocolBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [protocolBtn setTitle:@"<<汇贝送水服务协议>>" forState:UIControlStateNormal];
        [protocolBtn setTitleColor:[UIColor colorWithHexString:@"44b4ef"] forState:UIControlStateNormal];
        protocolBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [protocolBtn sizeToFit];
        self.protocolBtn = protocolBtn;
        [self addSubview:protocolBtn];
        [protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(chooseBtn.mas_right).offset(0);
            make.width.mas_equalTo(chooseBtn.mas_width);
            make.centerY.mas_equalTo(chooseBtn.mas_centerY);
        }];
        

    }
    return self;
}
@end
