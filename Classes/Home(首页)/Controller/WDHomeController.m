//
//  WDHomeController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDHomeController.h"
#import "WDMylocationFootView.h"
#import "WDImageScrollView.h"
#import "WDShopNameView.h"
#import "WDLocationController.h"
#import "WDDropDownItem.h"
//#import <CoreLocation/CLAvailability.h>
//#import "AMapLocationKit.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import "WDMylocationView.h"
#import "WDWaterStationController.h"
#import "WDWaterStationListController.h"
#import "WDUserTool.h"
#import "WDUserInfo.h"
#import "WDHttpRequestTool.h"
#import "WDDefaultAddressModel.h"
#import "MJExtension.h"
#import "WDChooseAddressController.h"

@interface WDHomeController (){
}
@property(nonatomic,weak)WDMylocationFootView *footView;
@property(nonatomic,weak)WDImageScrollView *imageView;
@property(nonatomic,weak)WDDropDownItem *leftBtn;
@property(nonatomic,strong)NSString *currentCityName;
// 我的位置信息
@property(nonatomic,copy)CLLocation *location;
//我的当前位置
@property(nonatomic,copy)NSString *addrInfo;
@end

@implementation WDHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingUIView];
    [self settingNavItem];
    // 获取默认地址
    [self getDefaultAddress];
    // 注册定位通知
    [self setupNotificates];
}
#pragma mark - 请求默认地址
-(void)getDefaultAddress
{
    if ([WDUserTool hasLogin]) {
        WDUserInfo *user = [WDUserTool currentUser];
        NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@&%@",[WDHttpRequestTool appKey],user.access_token_secret]];
        NSDictionary *accessInfo = @{
                                     @"app_key":[WDHttpRequestTool appKey],
                                     @"signature":signature,
                                     @"access_token":user.access_token_secret,
                                     @"phone_num":user.phone_num
                                    };
        NSDictionary *param = @{
                                @"accessInfo":accessInfo,
                                @"sign":@"sign"
                                };

        [WDHttpRequestTool requestWithUrl:@"delieveryAddress/showDefaultAddress" params:param successBlock:^(id json) {
//            WDDefaultAddressModel *addrM = [WDDefaultAddressModel mj_objectWithKeyValues:json];
        }];
    }else{
        [SVProgressHUD showInfoWithStatus:@"请登录！"];
        return;
    }
}
-(void)settingUIView
{
    WDMylocationFootView *footView= [[WDMylocationFootView alloc]init];
    [footView.buyBtn addTarget:self action:@selector(buyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [footView.locaView.locaBtn addTarget:self action:@selector(locationChoose) forControlEvents:UIControlEventTouchUpInside];
    self.footView = footView;
    [self.view addSubview:footView];
    [footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(120);
        make.bottom.mas_equalTo(-44);
    }];
    
    WDImageScrollView *imageView = [[WDImageScrollView alloc]init];
    imageView.shopViewHidden = YES;
    imageView.backgroundColor = [UIColor yellowColor];
    self.imageView = imageView;
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.bottom.mas_equalTo(footView.mas_top).offset(-1);
    }];
    
}
#pragma mark - 进入水站
-(void)buyBtnClick
{
    WDWaterStationListController *descVc = [[WDWaterStationListController alloc]init];
    descVc.title = @"附近水站";
    descVc.location = self.location;
    descVc.addrInfo = self.addrInfo;
    descVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:descVc animated:YES];
}

-(void)settingNavItem
{
    WDDropDownItem *leftBtn = [[WDDropDownItem alloc]init];
    leftBtn.frame = CGRectMake(-60, 0, 90, 44);
    self.leftBtn = leftBtn;
    [leftBtn addTarget:self action:@selector(chooseCity) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(0, 0, 32, 20);
    rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [rightBtn setImage:[UIImage imageNamed:@"home_navmap"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"home_nav_hourse_white"] forState:UIControlStateSelected];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;

}
#pragma mark - 选择送水位置
-(void)locationChoose
{
    WDChooseAddressController *chooseVc = [[WDChooseAddressController alloc]init];
    chooseVc.title = @"送水位置";
    chooseVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chooseVc animated:YES];
}
#pragma mark - 注册定位通知
-(void)setupNotificates
{
    [[NSNotificationCenter defaultCenter] addObserverForName:LocaOK object:nil queue:[NSOperationQueue currentQueue] usingBlock:^(NSNotification *note) {
        NSDictionary *object = note.userInfo;
        NSLog(@"%@",object);
        NSString *addr = object[@"addr"];
        NSString *currentCityName = object[@"cityName"];
        CLLocation *location = object[@"location"];
        self.addrInfo = addr;
        self.location = location;
        self.currentCityName = currentCityName;
        self.leftBtn.titleLabel.text = currentCityName;
        [self.footView.locaView.locaBtn setTitle:addr forState:UIControlStateNormal];
    }];
    
}
-(void)chooseCity
{
    WDLocationController *descVc = [[WDLocationController alloc]init];
    descVc.title = @"选择城市";
    descVc.currentCityName = @"北京";
    descVc.cityBlock = ^(NSString *cityName){
        self.leftBtn.titleLabel.text = cityName;
        
    };
    descVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:descVc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 获取默认地址
    [self getDefaultAddress];
}
@end
