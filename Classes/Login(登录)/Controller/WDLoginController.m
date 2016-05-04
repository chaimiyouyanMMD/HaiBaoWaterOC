//
//  WDLoginController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/29.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDLoginController.h"
#import "WDLoginFootView.h"
#import "WDLoginView.h"
#import "WDRegisterController.h"
#import "WDFindPasswordController.h"
#import "WDUserInfo.h"

@interface WDLoginController ()
@property(nonatomic,weak)WDLoginFootView *footView;
@end

@implementation WDLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    WDLoginFootView *footView = [[WDLoginFootView alloc]init];
    [footView.findPWDBtn addTarget:self action:@selector(findPwdClick) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tectChange) name:UITextFieldTextDidChangeNotification object:footView.loginView.accountTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tectChange) name:UITextFieldTextDidChangeNotification object:footView.loginView.pwdTextField];
    [footView.loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.footView = footView;
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.tableFooterView = footView;
    [self setNav];
}
-(void)findPwdClick
{
    WDFindPasswordController *descVc = [[WDFindPasswordController alloc]init];
    descVc.title = @"找回密码";
    [self.navigationController pushViewController:descVc animated:YES];
}
#pragma mark - 监听输入框的变化
-(void)tectChange
{
    NSString *account = self.footView.loginView.accountTextField.text;
    NSString *pwd = self.footView.loginView.pwdTextField.text;
    self.footView.loginBtn.enabled = (account.length && pwd.length);

}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - 设置导航条的按钮
-(void)setNav
{
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.frame = CGRectMake(0, 0, 32, 44);
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(0, 0, 32, 44);
    [rightBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:@"注册" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightitem;
}


#pragma mark - 返回
-(void)backClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 注册
-(void)registerClick
{
    WDRegisterController *descVc = [[WDRegisterController alloc]init];
    descVc.title = @"免费注册";
    [self.navigationController pushViewController:descVc animated:YES];
}

#pragma mark - 登录
-(void)loginBtnClick
{
    NSString *userName = self.footView.loginView.accountTextField.text;
    if (userName.length == 0 || userName == nil) {
        [SVProgressHUD showInfoWithStatus:@"请输入帐号!"];
        return;
    }
    
    NSString *pwd = self.footView.loginView.pwdTextField.text;
    if (pwd.length == 0 || pwd == nil) {
        [SVProgressHUD showInfoWithStatus:@"请输入密码!"];
        return;
    }
    NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@",[WDHttpRequestTool appSecret]]];
    NSDictionary *accessInfo = @{
                                 @"app_key":[WDHttpRequestTool appKey],
                                 @"signature":signature
                                 };
    NSDictionary *params1 = @{
                             @"accessInfo":accessInfo,
                             @"phone_num":userName,
                             @"sign":@"sign"
                             };
    NSString *url = @"account/md5key";
    // 获取md5_key
    [WDHttpRequestTool requestWithUrl:url params:params1 successBlock:^(id json) {
        NSString *md5_key = json[@"md5_keyStr"];
        NSString *appSecret = [WDHttpRequestTool appSecret];
        NSString *md5_userName_pwd = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@%@%@",userName,pwd,md5_key]];
        NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@%@",appSecret,md5_userName_pwd]];
        NSDictionary *accessInfo1 = @{
                                     @"app_key":[WDHttpRequestTool appKey],
                                     @"signature":signature,
                                     @"phone_num":userName
                                     };
        NSDictionary *param1 = @{
                                 @"accessInfo":accessInfo1,
                                 @"signature":signature
                                 };
        NSMutableDictionary *params1 = [NSMutableDictionary dictionaryWithDictionary:param1];
        NSString *sign1 = [WDHttpRequestTool sign:params1];
        [params1 setObject:sign1 forKey:@"sign"];
        [WDHttpRequestTool requestWithUrl:@"account/login" params:params1 successBlock:^(id json) {
            NSString *sqlStr = [NSString stringWithFormat:@"phone==%@",userName];
            NSArray *users = [WDUserInfo dbObjectsWhere:sqlStr orderby:nil];
            if (users != nil) {
                // 更新
                WDUserInfo *user = [users lastObject];
                user.access_token = json[@"access_token"];
                user.access_token_secret = json[@"access_token_secret"];
                user.phone_num = userName;
                [user updatetoDb];
            }else{
                // 插入
                WDUserInfo *user = [[WDUserInfo alloc]init];
                user.access_token = json[@"access_token"];
                user.access_token_secret = json[@"access_token_secret"];
                user.phone_num = userName;
                [user insertToDb];
            }
            [self dismissViewControllerAnimated:YES completion:^{
                [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            }];
        }];
    }];
    
}
@end
