//
//  WDTabBarController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDTabBarController.h"
#import "WDHomeController.h"
#import "WDMineController.h"
#import "WDShoppingCarController.h"
#import "WDTicketController.h"
#import "WDNavigationController.h"

@interface WDTabBarController ()

@end

@implementation WDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.初始化所有的子控制器
    [self setupAllChildViewController];
}
-(void)setupAllChildViewController
{
    //WDHomeController
    WDHomeController *home = [[WDHomeController alloc]init];
    [self settingChildViewController:home title:@"订水" normalImage:@"tab_icon_dingshui_normal" selectedImage:@"tab_icon_dingshui_selected"];
    
    //WDHomeController
    WDTicketController *ticket = [[WDTicketController alloc]init];
    [self settingChildViewController:ticket title:@"水票" normalImage:@"tab_icon_shuipiao_normal" selectedImage:@"tab_icon_shuipiao_selected"];
    
    //WDHomeController
    WDShoppingCarController *shoppingCar = [[WDShoppingCarController alloc]init];
    [self settingChildViewController:shoppingCar title:@"购物车" normalImage:@"tab_icon_gouwuche_normal" selectedImage:@"tab_icon_gouwuche_selected"];
    
    WDMineController *mine = [[WDMineController alloc]init];
    [self settingChildViewController:mine title:@"我的" normalImage:@"tab_icon_me_normal" selectedImage:@"tab_icon_me_selected"];
    
}
-(void)settingChildViewController:(UIViewController *)childVc title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:normalImage];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    WDNavigationController *nav = [[WDNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}
@end
