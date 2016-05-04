//
//  WDPayModel.h
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/19.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDBaseModel.h"

@interface WDPayModel : WDBaseModel
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subTitle;
+(instancetype)payModelWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle;
@end
