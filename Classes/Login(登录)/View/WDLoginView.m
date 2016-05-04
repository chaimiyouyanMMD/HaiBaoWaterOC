//
//  WDLoginView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/29.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDLoginView.h"
@interface WDLoginView ()
@property(nonatomic,weak)UILabel *accountLabel;
@property(nonatomic,weak)UIView *lineView;
@property(nonatomic,weak)UILabel *pwdLabel;
@end
@implementation WDLoginView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        /**
         *  accountLabel
         */
        UILabel *accountLabel = [[UILabel alloc]init];
        accountLabel.text = @"帐号:";
        accountLabel.textColor = [UIColor colorWithHexString:@"333333"];
        accountLabel.font = [UIFont systemFontOfSize:14];
        [accountLabel sizeToFit];
        self.accountLabel = accountLabel;
        [self addSubview:accountLabel];
        [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(12);
        }];
        
        /**
         *  accountTextField
         */
        UITextField *accountTextField = [[UITextField alloc]init];
        accountTextField.textColor = [UIColor colorWithHexString:@"777777"];
        accountTextField.font = [UIFont systemFontOfSize:14];
        [accountTextField sizeToFit];
        accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        accountTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.accountTextField = accountTextField;
        [self addSubview:accountTextField];
        [accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(accountLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(accountLabel.mas_centerY);
            make.right.mas_equalTo(-12);
            make.height.mas_equalTo(44);

        }];
        
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        lineView.alpha = 0.3;
        self.lineView = lineView;
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(1);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(accountLabel.mas_bottom).offset(12);
        }];
        
        /**
         *  accountLabel
         */
        UILabel *pwdLabel = [[UILabel alloc]init];
        pwdLabel.text = @"密码:";
        pwdLabel.textColor = [UIColor colorWithHexString:@"333333"];
        pwdLabel.font = [UIFont systemFontOfSize:14];
        [pwdLabel sizeToFit];
        self.pwdLabel = pwdLabel;
        [self addSubview:pwdLabel];
        [pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(lineView.mas_bottom).offset(12);
        }];
        
        /**
         *  accountTextField
         */
        UITextField *pwdTextField = [[UITextField alloc]init];
        pwdTextField.secureTextEntry = YES;
        pwdTextField.clearsOnBeginEditing = YES;
        pwdTextField.textColor = [UIColor colorWithHexString:@"777777"];
        pwdTextField.font = [UIFont systemFontOfSize:14];
        [pwdTextField sizeToFit];
        pwdTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        pwdTextField.keyboardType = UIKeyboardTypeDefault;
        self.pwdTextField = pwdTextField;
        [self addSubview:pwdTextField];
        [pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(pwdLabel.mas_right).offset(6);
            make.right.mas_equalTo(-12);
            make.height.mas_equalTo(44);
            make.centerY.mas_equalTo(pwdLabel.mas_centerY);
        }];

    }
    return self;
}
@end
