//
//  WDMerchantDetailController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#import "WDMerchantDetailController.h"
#import "WDShopListModel.h"
#import "WDHttpRequestTool.h"
#import "WDMerchantDetailModel.h"
#import "WDDetailCellModel.h"
#import "WDCellSectionModel.h"
#import "WDDetailCell.h"
#import "WDImageScrollView.h"
#import "WDImageScrollModel.h"

#import "WDSubShopController.h"
#import "WDCommentController.h"
#import "WDShareModel.h"
@interface WDMerchantDetailController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)WDMerchantDetailModel *merchantInfoM;
@property(nonatomic,strong)NSMutableArray *allData;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation WDMerchantDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[WDMerchantDetailCell class] forCellReuseIdentifier:@"WDMerchantDetailCell"];
    [tableView registerClass:[WDImageScrollView class] forCellReuseIdentifier:@"WDImageScrollCell"];
    [tableView registerClass:[WDDetailSummaryCell class] forCellReuseIdentifier:@"WDDetailSummaryCell"];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
    tableView.tableFooterView = [[UIView alloc]init];
    [self setNav];
    
}
#pragma marrk - 分享
-(void)setNav
{
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(-60, 0, 60, 32);
    [rightBtn setImage:[UIImage imageNamed:@"nav_btn_share"] forState:UIControlStateNormal];
    rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [rightBtn sizeToFit];
    [rightBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
#pragma mark - 分享
-(void)share
{
    NSDictionary *accessInfo = @{
                                 @"app_key":[WDHttpRequestTool appKey],
                                 @"signature":[WDHttpRequestTool digest:[NSString stringWithFormat:@"%@",[WDHttpRequestTool appSecret]]]
                                 };
    NSDictionary *param = @{
                            @"shopId":@(self.model.shopId),
                            @"sign":[WDHttpRequestTool sign:[NSMutableDictionary dictionaryWithDictionary:accessInfo]],
                            @"accessInfo":accessInfo
                            };
    [WDHttpRequestTool requestWithUrl:@"shop/share" params:param successBlock:^(id json) {
//        WDShareModel *shareM = [WDShareModel mj_objectWithKeyValues:json];
        
        
    }];
}
-(NSMutableArray*)allData{
    if (_allData== nil) {
        _allData = [NSMutableArray arrayWithCapacity:3];
    }
    return _allData ;
}
-(void)requestData
{
    NSDictionary *accessInfo;
    if ([WDUserTool hasLogin]) {
        WDUserInfo *user = [WDUserTool currentUser];
        NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@&%@",[WDHttpRequestTool appSecret],user.access_token_secret]];
        accessInfo = @{
                       @"app_key":[WDHttpRequestTool appKey],
                       @"signature":signature,
                       @"access_token":user.access_token,
                       @"phone_num":user.phone_num
                       };
    }else{
        accessInfo = @{
                       @"app_key":[WDHttpRequestTool appKey],
                       @"signature":[WDHttpRequestTool digest:[WDHttpRequestTool appSecret]]
                       };
    }
    
    NSDictionary *positionInfo = @{
                                   @"districtId":@"",
                                   @"position_x":self.model.xAxis,
                                   @"position_y":self.model.yAxis,
                                   @"addressInfo":self.model.address,
                                   @"phoneCode":@""
                                   };
    
    NSDictionary *params = @{
                             @"accessInfo":accessInfo,
                             @"positionInfo":positionInfo,
                             @"shopId":@(self.model.shopId),
                             @"sign":[WDHttpRequestTool sign:[NSMutableDictionary dictionaryWithDictionary:accessInfo]],
                             @"viewCount":[NSNumber numberWithInt:2],
                             @"x_dpi":@(self.view.frame.size.width)
                             };
    [WDHttpRequestTool requestWithUrl:@"shop/shopDetail" params:params successBlock:^(id json) {
        
        WDMerchantDetailModel *model = [WDMerchantDetailModel mj_objectWithKeyValues:json];
        self.merchantInfoM = model;
        
        [self settingUIViewWithMerchantInfoM:model];
        [self.tableView reloadData];
    }];
}
-(void)settingUIViewWithMerchantInfoM:(WDMerchantDetailModel *)merchantInfoM
{
    WDImageScrollModel *imageM = [WDImageScrollModel cellWithIcons:@[merchantInfoM.big_image] shopName:self.model.merchantName sore:self.model.score shopViewHidden:NO];
    imageM.cellHeight = 220;
    imageM.cellKey = @"WDImageScrollCell";
    WDCellSectionModel *sec0 = [WDCellSectionModel sectionWithItems:@[imageM] secHeadView:nil secHeadHeight:0];
    
    WDMerchantDetailCellModel *redWalletM = [WDMerchantDetailCellModel cellWithIcon:@"iconfont-hongbao" title:@"红包" content:@"送100元代金劵红包" subTitle:@"领取" arrow:@"btn_right_arrow"];
    redWalletM.cellHeight = 44;
    redWalletM.cellKey = @"WDMerchantDetailCell";
    WDMerchantDetailCellModel *reduceM = [WDMerchantDetailCellModel cellWithIcon:@"iconfont-jian" title:@"立减" content:nil subTitle:@"" arrow:@""];
    reduceM.cellHeight = 44;
    reduceM.cellKey = @"WDMerchantDetailCell";
    WDMerchantDetailCellModel *returnM = [WDMerchantDetailCellModel cellWithIcon:@"iconfont-daijinquan" title:@"返劵" content:nil subTitle:@"" arrow:@""];
    returnM.cellHeight = 44;
    returnM.cellKey = @"WDMerchantDetailCell";

    WDCellSectionModel *sec1 = [WDCellSectionModel sectionWithItems:@[redWalletM,reduceM,returnM] secHeadView:nil secHeadHeight:0];
    
    WDMerchantDetailCellModel *addrM = [WDMerchantDetailCellModel cellWithIcon:@"icon_location" title:merchantInfoM.shopAddress content:nil subTitle:nil arrow:nil];
    addrM.cellHeight = 44;
    addrM.cellKey = @"WDMerchantDetailCell";
    WDMerchantDetailCellModel *phoneM = [WDMerchantDetailCellModel cellWithIcon:@"icon_phone" title:merchantInfoM.shopTelephone content:nil subTitle:nil arrow:nil];
    phoneM.cellHeight = 44;
    phoneM.cellKey = @"WDMerchantDetailCell";

    WDMerchantDetailCellModel *subShopM = [WDMerchantDetailCellModel cellWithIcon:@"icon_fendian" title:@"其他分店" content:nil subTitle:merchantInfoM.shopCount arrow:@"btn_right_arrow"];
    subShopM.cellHeight = 44;
    subShopM.cellKey = @"WDMerchantDetailCell";
    subShopM.clickBlock = ^{
        WDSubShopController *desc = [[WDSubShopController alloc]init];
        desc.title = [NSString stringWithFormat:@"其他分店%@",merchantInfoM.shopCount];
        desc.otherShops = merchantInfoM.otherShop;
        [self.navigationController pushViewController:desc animated:YES];
    };

    WDCellSectionModel *sec2 = [WDCellSectionModel sectionWithItems:@[addrM,phoneM,subShopM] secHeadView:nil secHeadHeight:0];
    
    WDMerchantDetailCellModel *timeM = [WDMerchantDetailCellModel cellWithIcon:@"icon_peisong" title:@"配送时间" content:@"工作时间2小时内" subTitle:nil arrow:nil];
    timeM.cellHeight = 44;
    timeM.cellKey = @"WDMerchantDetailCell";

    WDMerchantDetailCellModel *rangeM = [WDMerchantDetailCellModel cellWithIcon:@"icon_time" title:@"配送范围" content:@"附近5公里内配送" subTitle:nil arrow:nil];
    rangeM.cellHeight = 44;
    rangeM.cellKey = @"WDMerchantDetailCell";
    WDCellSectionModel *sec3 = [WDCellSectionModel sectionWithItems:@[timeM,rangeM] secHeadView:nil secHeadHeight:0];
    
    WDDetailSummaryCellModel *summaryM = [WDDetailSummaryCellModel cellWithTitle:@"商家介绍:" content:merchantInfoM.summary];
    summaryM.cellHeight = 88;
    summaryM.cellKey = @"WDDetailSummaryCell";
    WDCellSectionModel *sec4 = [WDCellSectionModel sectionWithItems:@[summaryM] secHeadView:nil secHeadHeight:0];
    
    WDDetailSummaryCellModel *commentM = [WDDetailSummaryCellModel cellWithTitle:[NSString stringWithFormat:@"商家评论(%lu)",(unsigned long)merchantInfoM.reviewItemList.count] content:nil];
    commentM.cellHeight = 44;
    commentM.cellKey = @"WDDetailSummaryCell";
    commentM.arrowType = UITableViewCellAccessoryDisclosureIndicator;
    commentM.clickBlock = ^{
        WDCommentController *desc = [[WDCommentController alloc]init];
        desc.title = @"评论列表";
        desc.shopModel = self.model;
        [self.navigationController pushViewController:desc animated:YES];
    };
    WDCellSectionModel *sec5 = [WDCellSectionModel sectionWithItems:@[commentM] secHeadView:nil secHeadHeight:0];

    self.allData = [NSMutableArray arrayWithArray:@[sec0,sec1,sec2,sec3,sec4,sec5]];
}
#pragma mark - tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    WDCellSectionModel *secM = self.allData[section];
    return secM.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc]init];
    footView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    return footView;
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
