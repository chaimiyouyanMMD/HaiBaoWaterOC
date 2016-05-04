//
//  WDEditNameController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/29.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDEditNameController.h"

@interface WDEditNameController ()
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UITextField *textField;
@end

@implementation WDEditNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.text = @"海豹队员的名字:";
    titleLabel.textAlignment = NSTextAlignmentRight;
    titleLabel.textColor = [UIColor colorWithHexString:@"777777"];
    titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel = titleLabel;
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(0);
        make.top.mas_equalTo(76);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(140);
    }];
    
    UITextField *textField = [[UITextField alloc]init];
    UIView *leftView = [[UIView alloc]init];
    leftView.frame = CGRectMake(0, 0, 12, 44);
    textField.leftView = leftView;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.backgroundColor = [UIColor whiteColor];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.textColor = [UIColor colorWithHexString:@"777777"];
    textField.font = [UIFont systemFontOfSize:14];
    self.textField = textField;
    [self.view addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel.mas_right).offset(0);
        make.trailing.mas_equalTo(0);
        make.top.mas_equalTo(76);
        make.height.mas_equalTo(44);
    }];
    [self setNav];
}
-(void)setNav{
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(0, 0, 40, 40);
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor colorWithHexString:@"44a4ef"] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn addTarget:self action:@selector(saveName ) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)saveName{
    NSString *name = self.textField.text;
    if (self.saveNameBlock) {
        self.saveNameBlock(name);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
