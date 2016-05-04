//
//  WDCommentController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDCommentController.h"
#import "WDCommentModel.h"
#import "WDCommentCell.h"
#import "UIScrollView+EmptyDataSet.h"
#import "WDShopListModel.h"
#import "WDProductInfoModel.h"
@interface WDCommentController ()<DZNEmptyDataSetDelegate,DZNEmptyDataSetSource,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *allComment;
@end

@implementation WDCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[WDCommentCell class] forCellReuseIdentifier:@"WDCommentController"];
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self requestCommentListWithPageSize:50 pageNo:1];
   
}
-(void)requestCommentListWithPageSize:(int)pageSize pageNo:(int)pageNo
{
    
    int shopId = 0 ;
    if (self.shopModel) {
        shopId = self.shopModel.shopId ;
    }
    else{
        shopId = self.productInfoModel.shopId ;
    }
    
    NSDictionary* requestPageInfo = @{
                                      @"pageSize":@(pageSize),
                                      @"pageNo":@(pageNo)
                                      };
    NSDictionary *accessInfo = @{
                                 @"app_key":[WDHttpRequestTool appKey],
                                 @"signature":[WDHttpRequestTool digest:[WDHttpRequestTool appSecret]]
                                 };
    NSDictionary *param = @{
                            @"requestPageInfo":requestPageInfo,
                            @"shopId":@(shopId),
                            @"sign":[WDHttpRequestTool sign:[NSMutableDictionary dictionaryWithDictionary:accessInfo]],
                            @"accessInfo":accessInfo
                            };
    [WDHttpRequestTool requestWithUrl:@"shop/reviewList" params:param successBlock:^(id json) {
        NSArray *allData = [WDCommentModel mj_objectArrayWithKeyValuesArray:json
                            [@"item_respList"]];
        self.allComment = allData;
        if (allData.count == 0) {
            self.tableView.emptyDataSetDelegate = self;
            self.tableView.emptyDataSetSource = self;
        }
        [self.tableView reloadData];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allComment.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDCommentModel *model = self.allComment[indexPath.row];
    WDCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDCommentController"];
    cell.commentM = model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
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
