//
//  WDAddressCell.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WDAddressModel;
@interface WDAddressCell : UITableViewCell

@property(nonatomic,weak)UIButton *defauleBtn;
@property(nonatomic,weak)UIButton *editBtn;
@property(nonatomic,weak)UIButton *deleteBtn;
@property(nonatomic,strong)WDAddressModel *addrM;
@end
