//
//  WDRegisterController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/30.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDRegisterController.h"
#import "WDRegisterFootView.h"
#import "WDRegisterView.h"
@interface WDRegisterController ()
@property(nonatomic,weak)WDRegisterFootView *footView;
@end

@implementation WDRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    WDRegisterFootView *footView = [[WDRegisterFootView alloc]init];
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:footView.registerView.accountField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:footView.registerView.codeField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:footView.registerView.psswordField];
    self.footView = footView;
    self.tableView.tableFooterView = footView;
}
-(void)textChange
{
    NSString *account = self.footView.registerView.accountField.text;
    NSString *code = self.footView.registerView.codeField.text;
    NSString *pwd = self.footView.registerView.psswordField.text;

    self.footView.finishBtn.enabled = (account.length && pwd.length && code.length);
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
