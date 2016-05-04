//
//  WDDefaultAddressModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/11.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDDefaultAddressModel : NSObject
//Printing description of json:
//{
//    address = "<null>";
//    cityId = 0;
//    fullAddress = "\U9999\U6e2f\U5c9b\U4e2d\U73af\U673a\U573a\U5feb\U7ebf\U9999\U6e2f\U7ad9\U5730\U4e0b1\U5c42HOK67\U53f7\U94fa001";
//    isDefault = 1;
//    mobile = "555-522-8243";
//    postionX = "114.163178";
//    postionY = "22.281969";
//    provinceId = 0;
//    src = 2;
//    userId = 6560;
//    userName = HaroAnna;
//}

@property(nonatomic,copy)NSString *address;
@property(nonatomic,assign)int cityId;
@property(nonatomic,copy)NSString *fullAddress;
@property(nonatomic,assign)int isDefault;
@property(nonatomic,copy)NSString *mobile;
@property(nonatomic,copy)NSString *postionX;
@property(nonatomic,copy)NSString *postionY;
@property(nonatomic,assign)int provinceId;
@property(nonatomic,assign)int src;
@property(nonatomic,assign)int userId;
@property(nonatomic,copy)NSString *userName;


@end
