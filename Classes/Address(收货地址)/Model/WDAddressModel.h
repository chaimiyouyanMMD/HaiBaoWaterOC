//
//  WDAddressModel.h
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/2.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface WDAddressModel : NSObject
//addressId = 211;
//addressType = 0;
//canDeliever = 0;
//cityId = 0;
//fullAddress = "\U4e1c\U534e\U95e8\U8857\U9053\U7f0e\U5e93\U80e1\U540c48\U53f7wwww";
//isDefault = 0;
//"phone_num" = 17600850481;
//"position_x" = "116.406";
//"position_y" = "39.9114";
//provinceId = 0;
//"recieve_name" = jijij;




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
@property(nonatomic,assign)int addressId;
@property(nonatomic,assign)int addressType;
@property(nonatomic,assign)int canDeliever;
@property(nonatomic,assign)int cityId;
@property(nonatomic,copy)NSString *fullAddress;
@property(nonatomic,assign)BOOL isDefault;
@property(nonatomic,copy)NSString *phone_num;
@property(nonatomic,copy)NSString *position_x;
@property(nonatomic,copy)NSString *position_y;
@property(nonatomic,assign)int provinceId;
@property(nonatomic,copy)NSString *recieve_name;
@end
