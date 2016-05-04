//
//  WDTableViewController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDTableViewController.h"

@interface WDTableViewController ()<DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@end

@implementation WDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TPKeyboardAvoidingTableView *tableView = [[TPKeyboardAvoidingTableView alloc]init];
    tableView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.and.right.mas_equalTo(0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
