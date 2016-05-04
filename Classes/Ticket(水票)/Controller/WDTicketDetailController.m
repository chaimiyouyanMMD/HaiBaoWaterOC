//
//  WDTicketDetailController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDTicketDetailController.h"
#import "WDWaterTicketModel.h"
#import "WDDetailCell.h"
#import "WDDetailCellModel.h"
#import "WDImageScrollView.h"
#import "WDImageScrollModel.h"

#import "WDCellSectionModel.h"
#import "WDCommentController.h"
#import "WDWaterStationFootBar.h"

@interface WDTicketDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *allData;
@property(nonatomic,weak)WDTicketDetailFootBar *footBar;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation WDTicketDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[WDDetailServiceCell class] forCellReuseIdentifier:@"WDDetailServiceCell"];
    [tableView registerClass:[WDImageScrollView class] forCellReuseIdentifier:@"WDImageScrollCell"];
    [tableView registerClass:[WDDetailSummaryCell class] forCellReuseIdentifier:@"WDDetailSummaryCell"];
    [tableView registerClass:[WDDetailCell class] forCellReuseIdentifier:@"WDDetailCell"];
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_offset(0);
        make.bottom.mas_offset(-48);
    }];
    
    WDTicketDetailFootBar *footBar = [[WDTicketDetailFootBar alloc]init];
    self.footBar = footBar;
    [self.view addSubview:footBar];
    [footBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_offset(48);
    }];
    
    [self requestWithTicketModel:self.ticketModel];
    
  
}
-(NSMutableArray*)allData{
    if (_allData== nil) {
        _allData = [NSMutableArray arrayWithCapacity:3];
    }
    return _allData ;
}
-(void)requestWithTicketModel:(WDWaterTicketModel *)ticketModel
{
    
    WDImageScrollModel *imageM = [WDImageScrollModel cellWithIcons:nil shopName:nil sore:0 shopViewHidden:YES];
    imageM.cellHeight = 220;
    imageM.cellKey = @"WDImageScrollCell";
    
    WDDetailCellModel *detailM = [WDDetailCellModel cellWithName:ticketModel.title promotion:@"促销" subName:ticketModel.productName price:[NSString stringWithFormat:@"%.2f",ticketModel.price] originalPrice:nil stock:@"库存:有现货" saleCount:[NSString stringWithFormat:@"已售%d",ticketModel.saleCount]];
    detailM.cellHeight = 140;
    detailM.cellKey = @"WDDetailCell";
    WDCellSectionModel *sec0 = [WDCellSectionModel sectionWithItems:@[imageM,detailM] secHeadView:nil secHeadHeight:0];
    
    WDDetailServiceCellModel *tickM = [WDDetailServiceCellModel cellWithTitle:@"水票:" activity:@"点击购买" content:@""];
    tickM.cellHeight = 44;
    tickM.arrowType = UITableViewCellAccessoryNone;
    tickM.cellKey = @"WDDetailServiceCell";
    WDCellSectionModel *sec1 = [WDCellSectionModel sectionWithItems:@[tickM] secHeadView:nil secHeadHeight:0];
    
    WDDetailServiceCellModel *summaryM = [WDDetailServiceCellModel cellWithTitle:@"详情:" activity:@"" content:@""];
    summaryM.cellHeight = 44;
    summaryM.cellKey = @"WDDetailServiceCell";
    summaryM.arrowType = UITableViewCellAccessoryDisclosureIndicator;
    
    WDCellSectionModel *sec2 = [WDCellSectionModel sectionWithItems:@[summaryM] secHeadView:nil secHeadHeight:0];
    
    WDDetailSummaryCellModel *commentM = [WDDetailSummaryCellModel cellWithTitle:[NSString stringWithFormat:@"水票评论"] content:nil];
    commentM.cellHeight = 44;
    commentM.cellKey = @"WDDetailSummaryCell";
    commentM.arrowType = UITableViewCellAccessoryDisclosureIndicator;
    commentM.clickBlock = ^{
        WDCommentController *desc = [[WDCommentController alloc]init];
        desc.title = @"评论列表";
//        desc.productInfoModel = self.productInfoModel;
        [self.navigationController pushViewController:desc animated:YES];
    };
    WDCellSectionModel *sec3 = [WDCellSectionModel sectionWithItems:@[commentM] secHeadView:nil secHeadHeight:0];
    
    self.allData = [NSMutableArray arrayWithArray:@[sec0,sec1,sec2,sec3]];
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.allData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    WDCellSectionModel *secM = self.allData[section];
    return secM.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WDCellSectionModel *secM = self.allData[indexPath.section];
    WDBaseModel *model = secM.items[indexPath.row];
    NSString *cellId = model.cellKey;
    WDBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = model.arrowType;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDCellSectionModel *secM = self.allData[indexPath.section];
    WDBaseModel *model = secM.items[indexPath.row];
    return model.cellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 12;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDCellSectionModel *secM = self.allData[indexPath.section];
    WDBaseModel *model = secM.items[indexPath.row];
    if (model.clickBlock) {
        model.clickBlock();
    }
}

@end
