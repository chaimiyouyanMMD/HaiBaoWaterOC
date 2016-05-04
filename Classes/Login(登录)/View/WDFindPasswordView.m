//
//  WDFindPasswordView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/30.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDFindPasswordView.h"
@interface WDFindPasswordView()
@property(nonatomic,weak)UILabel *phoneNumLabel;
@property(nonatomic,weak)UIView *line1;
@property(nonatomic,weak)UILabel *codeLabel;
@property(nonatomic,weak)UIView *line2;
@property(nonatomic,weak)UILabel *pwdLabel;
@property(nonatomic,weak)UIView *line3;

@property(nonatomic,weak)UILabel *againPwdLabel;
@end
@implementation WDFindPasswordView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        /**
         *  phoneNumLabel
         */
        UILabel *phoneNumLabel = [[UILabel alloc]init];
        phoneNumLabel.text = @"手机号";
        phoneNumLabel.textColor = [UIColor colorWithHexString:@"333333"];
        phoneNumLabel.font = [UIFont systemFontOfSize:14];
        [phoneNumLabel sizeToFit];
        phoneNumLabel.textAlignment = NSTextAlignmentRight;
        self.phoneNumLabel = phoneNumLabel;
        [self addSubview:phoneNumLabel];
        [phoneNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(44);
        }];
        
        UITextField *accountField = [[UITextField alloc]init];
        accountField.placeholder = @"请输入您的手机号";
        accountField.textColor = [UIColor colorWithHexString:@"333333"];
        accountField.font = [UIFont systemFontOfSize:14];
        [accountField sizeToFit];
        accountField.textAlignment = NSTextAlignmentLeft;
        self.accountField = accountField;
        [self addSubview:accountField];
        [accountField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(76);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(44);
            make.centerY.mas_equalTo(phoneNumLabel.mas_centerY);
        }];
        
        UIView *line1 = [[UIView alloc]init];
        line1.backgroundColor = [UIColor lightGrayColor];
        line1.alpha = 0.3;
        self.line1 = line1;
        [self addSubview:line1];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(phoneNumLabel.mas_bottom).offset(0);
        }];
        
        
        /**
         *  验证码
         */
        UILabel *codeLabel = [[UILabel alloc]init];
        codeLabel.text = @"验证码:";
        codeLabel.textColor = [UIColor colorWithHexString:@"333333"];
        codeLabel.font = [UIFont systemFontOfSize:14];
        [codeLabel sizeToFit];
        codeLabel.textAlignment = NSTextAlignmentRight;
        self.codeLabel = codeLabel;
        [self addSubview:codeLabel];
        [codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(line1.mas_bottom).offset(0);
            make.height.mas_equalTo(44);
            make.width.mas_equalTo(70);
        }];
        
        // 获取验证码
        UIButton *getCodeBtn = [[UIButton alloc]init];
        [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [getCodeBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
        getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [getCodeBtn sizeToFit];
        self.getCodeBtn = getCodeBtn;
        [self addSubview:getCodeBtn];
        [getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(88);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(44);
            make.centerY.mas_equalTo(codeLabel.mas_centerY);
        }];
        
        
        UITextField *codeField = [[UITextField alloc]init];
        codeField.placeholder = @"请输入验证码";
        codeField.textColor = [UIColor colorWithHexString:@"333333"];
        codeField.font = [UIFont systemFontOfSize:14];
        [codeField sizeToFit];
        codeField.textAlignment = NSTextAlignmentLeft;
        self.codeField = codeField;
        [self addSubview:codeField];
        [codeField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(76);
            make.height.mas_equalTo(44);
            make.right.mas_equalTo(-88);
            make.centerY.mas_equalTo(codeLabel.mas_centerY);
            
        }];
        
        UIView *line2 = [[UIView alloc]init];
        line2.backgroundColor = [UIColor lightGrayColor];
        line2.alpha = 0.3;
        self.line2 = line2;
        [self addSubview:line2];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(codeLabel.mas_bottom).offset(0);
        }];
        
        
        /**
         *  密码
         */
        UILabel *pwdLabel = [[UILabel alloc]init];
        pwdLabel.text = @"密码:";
        pwdLabel.textColor = [UIColor colorWithHexString:@"333333"];
        pwdLabel.font = [UIFont systemFontOfSize:14];
        [pwdLabel sizeToFit];
        pwdLabel.textAlignment = NSTextAlignmentRight;
        self.pwdLabel = pwdLabel;
        [self addSubview:pwdLabel];
        [pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(line2.mas_bottom).offset(0);
            make.height.mas_equalTo(44);
            make.width.mas_equalTo(70);
        }];
        
        UITextField *psswordField = [[UITextField alloc]init];
        psswordField.placeholder = @"请设置密码";
        psswordField.textColor = [UIColor colorWithHexString:@"333333"];
        psswordField.font = [UIFont systemFontOfSize:14];
        [psswordField sizeToFit];
        psswordField.textAlignment = NSTextAlignmentLeft;
        self.psswordField = psswordField;
        [self addSubview:psswordField];
        [psswordField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(76);
            make.height.mas_equalTo(44);
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(pwdLabel.mas_centerY);
        }];
        
        UIView *line3 = [[UIView alloc]init];
        line3.backgroundColor = [UIColor lightGrayColor];
        line3.alpha = 0.3;
        self.line3 = line3;
        [self addSubview:line3];
        [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(pwdLabel.mas_bottom).offset(0);
        }];
        
        /**
         *  确认密码
         */
        UILabel *againPwdLabel = [[UILabel alloc]init];
        againPwdLabel.text = @"确认密码:";
        againPwdLabel.textColor = [UIColor colorWithHexString:@"333333"];
        againPwdLabel.font = [UIFont systemFontOfSize:14];
        [againPwdLabel sizeToFit];
        againPwdLabel.textAlignment = NSTextAlignmentRight;
        self.againPwdLabel = againPwdLabel;
        [self addSubview:againPwdLabel];
        [againPwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(line3.mas_bottom).offset(0);
            make.height.mas_equalTo(44);
            make.width.mas_equalTo(70);
        }];
        
        UITextField *againPwdField = [[UITextField alloc]init];
        againPwdField.placeholder = @"请再次输入密码";
        againPwdField.textColor = [UIColor colorWithHexString:@"333333"];
        againPwdField.font = [UIFont systemFontOfSize:14];
        [againPwdField sizeToFit];
        againPwdField.textAlignment = NSTextAlignmentLeft;
        self.againPwdField = againPwdField;
        [self addSubview:againPwdField];
        [againPwdField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(76);
            make.height.mas_equalTo(44);
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(againPwdLabel.mas_centerY);
        }];

    }
    return self;
}

@end
