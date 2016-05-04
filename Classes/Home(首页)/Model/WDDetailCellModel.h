//
//  WDDetailCellModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDBaseModel.h"
// 商品的headView的Model
@interface WDDetailCellModel : WDBaseModel
@property(nonatomic,copy)NSString *name;
// 促销
@property(nonatomic,copy)NSString *promotion;
@property(nonatomic,copy)NSString *subName;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *originalPrice;
@property(nonatomic,copy)NSString *stock;
@property(nonatomic,copy)NSString *saleCount;
+(instancetype)cellWithName:(NSString *)name promotion:(NSString *)promotion subName:(NSString *)subName price:(NSString *)price originalPrice:(NSString *)originalPrice stock:(NSString *)stock saleCount:(NSString *)saleCount;
@end

// 服务cellModel
@interface WDDetailServiceCellModel : WDBaseModel
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *activity;
@property(nonatomic,copy)NSString *content;
+(instancetype)cellWithTitle:(NSString *)title activity:(NSString *)activity content:(NSString *)content;

@end

// 其他分店cellmodel
@interface WDMerchantDetailCellModel : WDBaseModel
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *subTitle;
@property(nonatomic,copy)NSString *arrow;
+(instancetype)cellWithIcon:(NSString *)icon title:(NSString *)title content:(NSString *)content subTitle:(NSString *)subTitle arrow:(NSString *)arrow;
@end

// 评价Model
@interface WDCommentCellModel : WDBaseModel
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *account;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *comment;
@property(nonatomic,copy)NSArray *photos;

+(instancetype)cellWithIcon:(NSString *)icon name:(NSString *)name account:(NSString *)account time:(NSString *)time comment:(NSString *)comment photos:(NSArray *)photos;
@end


// 商家介绍Model
@interface WDDetailSummaryCellModel : WDBaseModel
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *title;

+(instancetype)cellWithTitle:(NSString *)title content:(NSString *)content ;
@end



