//
//  WDWaterStationController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/2.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define headViewHeight 230
#import "WDWaterStationController.h"
#import "DOPDropDownMenu.h"
#import "WDShopListModel.h"
#import "WDWaterStationMerchantView.h"
#import "WDSpecialOffersView.h"
#import "WDWaterStationProductCell.h"
#import "WDProductListModel.h"
#import "MJExtension.h"
#import "WDWaterStationFootBar.h"
#import "WDMerchantDetailController.h"
#import "WDProductDetailController.h"
#import "WDUserTool.h"
#import "WDUserInfo.h"
#import "WDProductListModel.h"
#import "WDShoppingCarController.h"
#import "WDButton.h"
#import "WDShareModel.h"
#import "WDWaterStationListController.h"

@interface WDWaterStationController ()<DOPDropDownMenuDelegate,DOPDropDownMenuDataSource,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)WDWaterStationMerchantView *stationView;
@property(nonatomic,weak)WDSpecialOffersView *activityView;
@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,weak)DOPDropDownMenu *menuView;
@property(nonatomic,weak)WDWaterStationFootBar *footBar;
@property(nonatomic,weak)UIButton *switchBtn;
@property(nonatomic,strong)NSArray *cates;
@property(nonatomic,strong)NSArray *sorts;
@property(nonatomic,strong)NSArray *allData;

@end
@implementation WDWaterStationController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.cates = @[@"桶装水",@"瓶装水"];
    self.sorts = @[@"综合排序",@"销量排序",@"价格排序"];
    

    [self settingUIView];
    [self setNav];
    [self requestDataWithPageSize:50 pageNo:10 categoryId:0 sortType:0 reset:YES];
    
}
#pragma marrk - 分享
-(void)setNav
{
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(0, 0, 40, 32);
    [rightBtn setTitle:@"水站" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor colorWithHexString:@"44a4ef"] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn addTarget:self action:@selector(goShopList) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
#pragma mark - 进入水站列表
-(void)goShopList{
    WDWaterStationListController *desc = [[WDWaterStationListController  alloc]init];
    desc.title = @"附近水站";
    [self.navigationController pushViewController:desc animated:YES];
}
-(void)settingUIView
{
    WDWaterStationMerchantView *stationView = [[WDWaterStationMerchantView alloc]init];
    stationView.model = self.model;
    [stationView addTarget:self action:@selector(merchantDetail) forControlEvents:UIControlEventTouchUpInside];
    self.stationView = stationView;
    //    headView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 230);
    [self.view addSubview:stationView];
    [stationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(110);
        make.top.mas_equalTo(74);
    }];
    
    WDSpecialOffersView *activityView = [[WDSpecialOffersView alloc]init];
    self.activityView = activityView;
    //    headView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 230);
    [self.view addSubview:activityView];
    [activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(110);
        make.top.mas_equalTo(stationView.mas_bottom).offset(10);
    }];
    
    
    DOPDropDownMenu *menuView =[[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];;
    //    menuView.frame = CGRectMake(0, headViewHeight + 10 + 64 , SCREEN_WIDTH, 44);
    menuView.delegate = self;
    menuView.dataSource = self;
    menuView.backgroundColor = [UIColor whiteColor];
    self.menuView =menuView;
    [self.view addSubview:menuView];
    [menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(activityView.mas_bottom).offset(10);
        make.height.mas_equalTo(44);
        make.right.mas_equalTo(0);
    }];
    
    UITableView *tableView = [[UITableView alloc]init];
    //    tableView.frame = CGRectMake(0, headViewHeight + 10 + 44 +64, SCREEN_WIDTH, SCREEN_HEIGHT - 44 - 10 - 230);
    [tableView registerClass:[WDWaterStationProductCell class] forCellReuseIdentifier:@"WDWaterStationProductCell"];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc]init];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(menuView.mas_bottom).offset(1);
        make.bottom.mas_equalTo(-49);
    }];

    WDWaterStationFootBar *footBar = [[WDWaterStationFootBar alloc]init];
    // 客服
    [footBar.serviceBtn addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    // 收藏
    [footBar.collectionBtn addTarget:self action:@selector(collection) forControlEvents:UIControlEventTouchUpInside];
    // 购物车
    [footBar.shoppingCarBtn addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    // 去结算
    [footBar.clearBtn addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    
    self.footBar = footBar;
    [self.view addSubview:footBar];
    [footBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(48);
    }];
    
}
#pragma mark - 打电话
-(void)call
{
    NSString *phone = self.model.shopTelephone;
    if (phone == nil || phone.length == 0) {
        phone = self.model.telphone;
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phone]];
    [[UIApplication sharedApplication] openURL:url];
}
-(void)merchantDetail
{
    WDMerchantDetailController *desc = [[WDMerchantDetailController alloc]init];
    desc.title = @"商店详情";
    desc.model = self.model;
    [self.navigationController pushViewController:desc animated:YES];
}
#pragma mark - 获取该商店的商品list
-(void)requestDataWithPageSize:(int)pageSize pageNo:(int)pageNo categoryId:(int)categoryId sortType:(int)sortType reset:(BOOL)reset
{
    NSDictionary *requestPageInfo = @{
                                      @"pageSize":@(pageSize),
                                      @"pageNo":@(pageNo)
                                      };
    NSDictionary *accessInfo = @{
                                 @"app_key":[WDHttpRequestTool appKey],
                                 @"signature":[WDHttpRequestTool digest:[WDHttpRequestTool appSecret]]
                                 };
    NSDictionary *param = @{
                            @"shopId":@(self.model.shopId),
                            @"categoryId":@(categoryId),
                            @"sortType":@(sortType),
                            @"requestPageInfo":requestPageInfo,
                            @"accessInfo":accessInfo,
                            @"sign":@""
                            };
    [WDHttpRequestTool requestWithUrl:@"shop/productList" params:param successBlock:^(id json) {
        NSArray *allData = [WDProductListModel mj_objectArrayWithKeyValuesArray:json[@"productList"]];
        self.allData = allData;
        [self.tableView reloadData];
    }];
}
#pragma mark - tableView的代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDProductListModel *model = self.allData[indexPath.row];
    WDWaterStationProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDWaterStationProductCell"];
    cell.model = model;
    cell.cellShopingCarBlock = ^(WDProductListModel *productM){
        [self addShoppingCarWith:productM];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDProductListModel *model = self.allData[indexPath.row];
    WDProductDetailController *desc = [[WDProductDetailController alloc]init];
    desc.shopModel = self.model;
    desc.productM = model;
    desc.title = @"商品详情";
    desc.productId = model.productId;
    [self.navigationController pushViewController:desc animated:YES];
}

#pragma mark - 添加购物车
-(void)addShoppingCarWith:(WDProductListModel *)prodectM
{
    if ([WDUserTool hasLogin]) {
        WDUserInfo *user = [WDUserTool currentUser];
        NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@&%@",[WDHttpRequestTool appSecret],user.access_token_secret]];
        NSDictionary *accessInfo = @{
                                     @"app_key":[WDHttpRequestTool appKey],
                                     @"signature":signature,
                                     @"access_token":user.access_token,
                                     @"phone_num":user.phone_num
                                     };
        NSDictionary *item = @{
                               @"itemId":@"",
                               @"productId":@(prodectM.productId),
                               @"shopId":@(self.model.shopId),
                               @"productName":prodectM.title,
                               @"price":@(prodectM.price),
                               @"num":@(1),
                               @"productType":@(7),
                               @"preferentialId":@""
                               };
        NSDictionary *param = @{
                                @"sign":@"",
                                @"accessInfo":accessInfo,
                                @"item":item
                                };
        [WDHttpRequestTool requestWithUrl:@"shoppingcart/new" params:param successBlock:^(id json) {
            [SVProgressHUD showInfoWithStatus:@"添加成功!"];
        }];
    }
}
#pragma mark - 去结算
-(void)clear
{
    WDShoppingCarController *desc = [[WDShoppingCarController alloc]init];
    desc.title = @"购物车";
    [self.navigationController pushViewController:desc animated:YES];
}
#pragma mark - 收藏
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
                                @"shopId":@(self.model.shopId),
                                @"sign":[WDHttpRequestTool sign:[NSMutableDictionary dictionaryWithDictionary:accessInfo]]
                                };
        [WDHttpRequestTool requestWithUrl:@"favourite/shop/new" params:param successBlock:^(id json) {
            [SVProgressHUD showInfoWithStatus:@"收藏成功!"];
            
        }];
        
    }
}


#pragma mark - menu的代理
-(NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 2;
}
-(NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.cates.count;
    }
    return self.sorts.count;
}
-(NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column == 0) {
        return self.cates[indexPath.row];
    }
    return self.sorts[indexPath.row];
}
-(void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    
}
#pragma mark - scroll停止滚动的
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
#pragma mark - scroll即将拖拽的时候
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

@end
