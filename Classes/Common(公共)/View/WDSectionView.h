//
//  WDSectionView.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDSectionView : UIControl
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;
-(void)settingIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle;
@end
