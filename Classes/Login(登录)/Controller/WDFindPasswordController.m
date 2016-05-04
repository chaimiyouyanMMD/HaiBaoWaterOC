//
//  WDFindPasswordController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/30.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDFindPasswordController.h"
#import "WDFindPasswordFootView.h"
#import "WDFindPasswordView.h"
@interface WDFindPasswordController ()
@property(nonatomic,weak)WDFindPasswordFootView *footView;
@end

@implementation WDFindPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    WDFindPasswordFootView *footView = [[WDFindPasswordFootView alloc]init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:footView.passwordView.accountField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:footView.passwordView.codeField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:footView.passwordView.psswordField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:footView.passwordView.againPwdField];
    self.footView = footView;
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.tableFooterView = footView;

}
- (void)textChange {
    NSString *account = self.footView.passwordView.accountField.text;
    NSString *code = self.footView.passwordView.codeField.text;
    NSString *pwd2 = self.footView.passwordView.againPwdField.text;
    NSString *pwd = self.footView.passwordView.psswordField.text;
    self.footView.finishBtn.enabled = (account.length && pwd.length && code.length && pwd2.length);
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
