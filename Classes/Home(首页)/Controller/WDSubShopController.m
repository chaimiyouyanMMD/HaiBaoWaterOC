//
//  WDSubShopController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/8.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDSubShopController.h"
#import "WDSubShopCell.h"
#import "WDSubShopModel.h"
#import "UIScrollView+EmptyDataSet.h"

@interface WDSubShopController ()<UITableViewDataSource,UITableViewDelegate,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@end

@implementation WDSubShopController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.otherShops.count == 0) {
        self.tableView.emptyDataSetDelegate = self;
        self.tableView.emptyDataSetSource = self;
    }else{
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[WDSubShopCell class] forCellReuseIdentifier:@"WDSubShopController"];
    }

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.otherShops.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDSubShopModel *model = self.otherShops[indexPath.row];
    WDSubShopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDSubShopController"];
    cell.subShopM = model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

#pragma mark - DZNEmptyDataSetDelegate
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"seals"];
}
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"无评价信息";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -self.tableView.tableHeaderView.frame.size.height/2.0f;
}

@end
