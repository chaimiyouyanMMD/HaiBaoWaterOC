//
//  WDTableViewController.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDRootViewController.h"
#import "UIScrollView+EmptyDataSet.h"
#import "TPKeyboardAvoidingTableView.h"

@class TPKeyboardAvoidingTableView;
@interface WDTableViewController : WDRootViewController
@property(nonatomic,strong)TPKeyboardAvoidingTableView *tableView;
@end
