//
//  WDUser.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/31.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STDbObject.h"

@interface WDUserInfo : STDbObject
@property(nonatomic,strong)NSString *access_token;
@property(nonatomic,strong)NSString *access_token_secret;
@property(nonatomic,strong)NSString *phone_num;

@property(nonatomic,assign)int  haibaoId;
@property(nonatomic,assign)int userId;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *name;
@end
