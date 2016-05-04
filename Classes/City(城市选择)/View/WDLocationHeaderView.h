//
//  WDLocationHeaderView.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WDLocationGroup,WDLocationHeaderView;
@protocol WDLocationHeaderViewDelegate<NSObject>
@optional
-(void)headerViewDidClickedNameView:(WDLocationHeaderView *)headView;

@end

@interface WDLocationHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong)WDLocationGroup *group;
@property(nonatomic,weak)id<WDLocationHeaderViewDelegate>delegate;
// 类方法创建一个headView
+(instancetype)headViewWithTableView:(UITableView *)tableView;
@end
