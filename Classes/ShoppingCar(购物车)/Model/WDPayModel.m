//
//  WDPayModel.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/19.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDPayModel.h"

@implementation WDPayModel
+(instancetype)payModelWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle
{
    WDPayModel *model = [[WDPayModel alloc]init];
    model.icon = icon;
    model.title = title;
    model.subTitle = subTitle;
    return model;
}
@end
