//
//  WDDetailCellModel.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDDetailCellModel.h"
// 商品的headView的Model
@implementation WDDetailCellModel
+(instancetype)cellWithName:(NSString *)name promotion:(NSString *)promotion subName:(NSString *)subName price:(NSString *)price originalPrice:(NSString *)originalPrice stock:(NSString *)stock saleCount:(NSString *)saleCount
{
    WDDetailCellModel *model = [[WDDetailCellModel alloc]init];
    model.name = name;
    model.promotion = promotion;
    model.subName = subName;
    model.price = price;
    model.originalPrice = originalPrice;
    model.stock = stock;
    model.saleCount = saleCount;
    
    return model;
}
@end

// 服务cellModel
@implementation WDDetailServiceCellModel
+(instancetype)cellWithTitle:(NSString *)title activity:(NSString *)activity content:(NSString *)content
{
    WDDetailServiceCellModel *model = [[WDDetailServiceCellModel alloc]init];
    model.title = title;
    model.activity = activity;
    model.content = content;
    
    return model;
}
@end

// 其他分店cellmodel
@implementation WDMerchantDetailCellModel
+(instancetype)cellWithIcon:(NSString *)icon title:(NSString *)title content:(NSString *)content subTitle:(NSString *)subTitle arrow:(NSString *)arrow
{
    WDMerchantDetailCellModel *model = [[WDMerchantDetailCellModel alloc]init];
    model.icon = icon;
    model.title = title;
    model.content = content;
    model.subTitle = subTitle;
    model.arrow = arrow;
    return model;
}
@end


// 评价Model
@implementation WDCommentCellModel
+(instancetype)cellWithIcon:(NSString *)icon name:(NSString *)name account:(NSString *)account time:(NSString *)time comment:(NSString *)comment photos:(NSArray *)photos
{
    WDCommentCellModel *model = [[WDCommentCellModel alloc]init];
    model.icon = icon;
    model.name = name;
    model.account = account;
    model.time = time;
    model.comment = comment;

    model.photos = photos;


    return model;
}
@end

// 商家介绍Model
@implementation WDDetailSummaryCellModel
+(instancetype)cellWithTitle:(NSString *)title content:(NSString *)content
{
    WDDetailSummaryCellModel *model = [[WDDetailSummaryCellModel alloc]init];
    model.title = title;
    model.content = content;
    return model;
}
@end
