//
//  WDProductDetailController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDProductDetailController.h"
#import "WDProductInfoModel.h"
#import "WDDetailCellModel.h"
#import "WDCellSectionModel.h"
#import "WDCommentController.h"
#import "WDDetailCell.h"
#import "WDImageScrollView.h"
#import "WDImageScrollModel.h"
#import "WDWaterStationFootBar.h"
#import "WDButton.h"
#import "WDShareModel.h"
#import "WDProductListModel.h"
#import "WDShopListModel.h"
#import "WDShoppingCarController.h"
@interface WDProductDetailController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)WDProductInfoModel *productInfoModel;
@property(nonatomic,strong)NSMutableArray *allData;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,weak)WDProductDetailFootBar *footBar;
@end

@implementation WDProductDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  requestData];
    UITableView *tableView = [[UITableView alloc]init];
    tableView.tableFooterView = [[UIView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[WDDetailServiceCell class] forCellReuseIdentifier:@"WDDetailServiceCell"];
    [tableView registerClass:[WDImageScrollView class] forCellReuseIdentifier:@"WDImageScrollCell"];
    [tableView registerClass:[WDDetailSummaryCell class] forCellReuseIdentifier:@"WDDetailSummaryCell"];
    [tableView registerClass:[WDDetailCell class] forCellReuseIdentifier:@"WDDetailCell"];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.mas_equalTo(0);
        make.bottom.mas_offset(-48);
    }];
    
    WDProductDetailFootBar *footBar = [[WDProductDetailFootBar alloc]init];
    [footBar.serviceBtn addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    [footBar.merchantBtn addTarget:self action:@selector(backMerchant) forControlEvents:UIControlEventTouchUpInside];

    [footBar.collectionBtn addTarget:self action:@selector(collection) forControlEvents:UIControlEventTouchUpInside];
    [footBar.shoppingCarBtn addTarget:self action:@selector(goShoppingCar) forControlEvents:UIControlEventTouchUpInside];
    [footBar.addBtn addTarget:self action:@selector(goShoppingCar) forControlEvents:UIControlEventTouchUpInside];
    self.footBar = footBar;
    [self.view addSubview:footBar];
    [footBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_offset(48);
    }];
    [self setNav];
}
#pragma mark - 打电话
-(void)call
{
    NSString *phone = self.shopModel.shopTelephone;
    if (phone == nil || phone.length == 0) {
        phone = self.shopModel.telphone;
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phone]];
    [[UIApplication sharedApplication] openURL:url];
}
#pragma mark - 返回店铺
-(void)backMerchant
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma marrk - 收藏
-(void)collection
{
    if(![WDUserTool hasLogin]){
        [SVProgressHUD showInfoWithStatus:@"请登录！"];
        return ;
    }else{
        WDUserInfo *user = [WDUserTool currentUser];
        NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@&%@",[WDHttpRequestTool appSecret],user.access_token_secret]];
        NSDictionary *accessInfo = @{
                                     @"app_key":[WDHttpRequestTool appKey],
                                     @"signature":signature,
                                     @"access_token":user.access_token
                                     };
        NSDictionary *param = @{
                                @"accessInfo":accessInfo,
                                @"productId":@(self.productM.productId),
                                @"sign":[WDHttpRequestTool sign:[NSMutableDictionary dictionaryWithDictionary:accessInfo]]
                                };
        [WDHttpRequestTool requestWithUrl:@"favourite/product/new" params:param successBlock:^(id json) {
            [SVProgressHUD showInfoWithStatus:@"收藏成功!"];
            
        }];
        
    }

}
#pragma mark - 进入购物车
-(void)goShoppingCar
{
    WDShoppingCarController *descVc = [[WDShoppingCarController alloc]init];
    descVc.title = @"购物车";
    [self.navigationController pushViewController:descVc animated:YES];
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
                            @"productId":@(self.productM.productId),
                            @"sign":[WDHttpRequestTool sign:[NSMutableDictionary dictionaryWithDictionary:accessInfo]],
                            @"accessInfo":accessInfo
                            };
    [WDHttpRequestTool requestWithUrl:@"product/share" params:param successBlock:^(id json) {
        WDShareModel *shareM = [WDShareModel mj_objectWithKeyValues:json];
        
        
    }];

}

-(NSMutableArray*)allData{
    if (_allData== nil) {
        _allData = [NSMutableArray arrayWithCapacity:3];
    }
    return _allData ;
}
#pragma mark - 请求商品信息
-(void)requestData
{
    NSDictionary *accessInfo ;
    if([WDUserTool hasLogin]){
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
    NSDictionary *params = @{
                             @"productId":@(self.productId),
                             @"accessInfo":accessInfo,
                             @"sign":[WDHttpRequestTool sign:[NSMutableDictionary dictionaryWithDictionary:accessInfo]],
                             @"productModel":@""
                             };
    [WDHttpRequestTool requestWithUrl:@"product/detail" params:params successBlock:^(id json) {
        WDProductInfoModel *productInfoModel = [WDProductInfoModel mj_objectWithKeyValues:json
                                     [@"productInfo"]];
        self.productInfoModel = productInfoModel;
        [self settingUIViewWith:productInfoModel];
        [self.tableView reloadData];
    }];
}
-(void)settingUIViewWith:(WDProductInfoModel *)productInfoModel
{
    WDImageScrollModel *imageM = [WDImageScrollModel cellWithIcons:@[productInfoModel.big_image] shopName:nil sore:0 shopViewHidden:YES];
    imageM.cellHeight = 220;
    imageM.cellKey = @"WDImageScrollCell";
    
    WDDetailCellModel *detailM = [WDDetailCellModel cellWithName:productInfoModel.title promotion:@"促销" subName:productInfoModel.subTitle price:[NSString stringWithFormat:@"%.2f",productInfoModel.price] originalPrice:[NSString stringWithFormat:@"%.2f",productInfoModel.marketPrice] stock:@"库存:有现货" saleCount:[NSString stringWithFormat:@"已售%d",productInfoModel.salesCnt]];
    detailM.cellHeight = 140;
    detailM.cellKey = @"WDDetailCell";
    WDCellSectionModel *sec0 = [WDCellSectionModel sectionWithItems:@[imageM,detailM] secHeadView:nil secHeadHeight:0];
    
    WDDetailServiceCellModel *tickM = [WDDetailServiceCellModel cellWithTitle:@"水票:" activity:@"点击购买" content:@""];
    tickM.cellHeight = 44;
    tickM.arrowType = UITableViewCellAccessoryNone;
    tickM.cellKey = @"WDDetailServiceCell";
    WDCellSectionModel *sec1 = [WDCellSectionModel sectionWithItems:@[tickM] secHeadView:nil secHeadHeight:0];

    
    WDDetailServiceCellModel *cuxiaoM = [WDDetailServiceCellModel cellWithTitle:@"促销:" activity:@"满送" content:@"买5桶送鸡蛋1斤,买10桶送饮水机一台"];
    cuxiaoM.cellHeight = 44;
    cuxiaoM.cellKey = @"WDDetailServiceCell";
    
    WDDetailServiceCellModel *serviceM = [WDDetailServiceCellModel cellWithTitle:@"服务:" activity:@"2hours" content:@"市区内工作时间2小时内送达"];
    serviceM.cellHeight = 44;
    serviceM.cellKey = @"WDDetailServiceCell";
    
    WDDetailServiceCellModel *summaryM = [WDDetailServiceCellModel cellWithTitle:@"详情:" activity:@"" content:@""];
    summaryM.cellHeight = 44;
    summaryM.cellKey = @"WDDetailServiceCell";
    summaryM.arrowType = UITableViewCellAccessoryDisclosureIndicator;
    
    WDCellSectionModel *sec2 = [WDCellSectionModel sectionWithItems:@[cuxiaoM,serviceM,summaryM] secHeadView:nil secHeadHeight:0];
    
    WDDetailSummaryCellModel *commentM = [WDDetailSummaryCellModel cellWithTitle:[NSString stringWithFormat:@"商家评论"] content:nil];
    commentM.cellHeight = 44;
    commentM.cellKey = @"WDDetailSummaryCell";
    commentM.arrowType = UITableViewCellAccessoryDisclosureIndicator;
    commentM.clickBlock = ^{
        WDCommentController *desc = [[WDCommentController alloc]init];
        desc.title = @"评论列表";
        desc.productInfoModel = self.productInfoModel;
        [self.navigationController pushViewController:desc animated:YES];
    };
    WDCellSectionModel *sec3 = [WDCellSectionModel sectionWithItems:@[commentM] secHeadView:nil secHeadHeight:0];
    
    self.allData = [NSMutableArray arrayWithArray:@[sec0,sec1,sec2,sec3]];
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDCellSectionModel *secM = self.allData[indexPath.section];
    WDBaseModel *model = secM.items[indexPath.row];
    if (model.clickBlock) {
        model.clickBlock();
    }
}

@end






