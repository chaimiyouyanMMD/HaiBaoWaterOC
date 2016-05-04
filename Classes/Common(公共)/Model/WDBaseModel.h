//
//  WDBaseModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
typedef void (^CellClickHandler)(void);

#import <Foundation/Foundation.h>

@interface WDBaseModel : NSObject
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,copy)NSString *cellKey;
//@property(nonatomic,strong)Class descVc;
@property(nonatomic,copy)CellClickHandler clickBlock;
@property(nonatomic,assign)UITableViewCellAccessoryType arrowType;
@end
