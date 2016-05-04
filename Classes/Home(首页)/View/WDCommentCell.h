//
//  WDCommentCell.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WDCommentModel;
@interface WDCommentHeadView : UIControl
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UIImageView *arrowIcon;
@end
@interface WDCommentCell : UITableViewCell
@property(nonatomic,strong)WDCommentModel *commentM;
@end
