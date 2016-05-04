//
//  WDOrderDetailHeadView.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/19.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDOrderDetailHeadView.h"
@interface WDOrderStateView : UIView
@property(nonatomic,weak)UILabel *noTitleLabel;
@property(nonatomic,weak)UILabel *noLabel;

@property(nonatomic,weak)UILabel *timeTitleLabel;
@property(nonatomic,weak)UILabel *timeLabel;


@property(nonatomic,weak)UILabel *orderStateTitleLabel;
@property(nonatomic,weak)UILabel *orderStateLabel;
@end
@implementation WDOrderStateView
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *noTitleLabel = [[UILabel alloc]init];
        noTitleLabel.text = @"订单编号:";
        noTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        noTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.noTitleLabel = noTitleLabel;
        [self addSubview:noTitleLabel];
        [noTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(12);
        }];
        
        
        UILabel *noLabel = [[UILabel alloc]init];
        noLabel.text = @"4498766744";
        noLabel.textColor = [UIColor colorWithHexString:@"777777"];
        noLabel.font  = [UIFont systemFontOfSize:14];
        self.noLabel = noLabel;
        [self addSubview:noLabel];
        [noLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(noTitleLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(noTitleLabel.mas_centerY);
        }];
        
        
        UILabel *timeTitleLabel = [[UILabel alloc]init];
        timeTitleLabel.text = @"下单时间:";
        timeTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        timeTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.timeTitleLabel = timeTitleLabel;
        [self addSubview:timeTitleLabel];
        [timeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(noTitleLabel.mas_bottom).offset(12);
        }];
        
        
        UILabel *timeLabel = [[UILabel alloc]init];
        timeLabel.text = @"2016-09-09";
        timeLabel.textColor = [UIColor colorWithHexString:@"777777"];
        timeLabel.font  = [UIFont systemFontOfSize:14];
        self.timeLabel = timeLabel;
        [self addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(timeTitleLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(timeTitleLabel.mas_centerY);
        }];
        
        
        UILabel *orderStateTitleLabel = [[UILabel alloc]init];
        orderStateTitleLabel.text = @"订单状态:";
        orderStateTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        orderStateTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.orderStateTitleLabel = orderStateTitleLabel;
        [self addSubview:orderStateTitleLabel];
        [orderStateTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(timeTitleLabel.mas_bottom).offset(12);
        }];
        
        
        UILabel *orderStateLabel = [[UILabel alloc]init];
        orderStateLabel.text = @"待支付";
        orderStateLabel.textColor = [UIColor colorWithHexString:@"44a4ef"];
        orderStateLabel.font  = [UIFont systemFontOfSize:14];
        self.orderStateLabel = orderStateLabel;
        [self addSubview:orderStateLabel];
        [orderStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(orderStateTitleLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(orderStateTitleLabel.mas_centerY);
        }];

    }
    return self;
}
@end
@interface WDAddressView : UIView
@property(nonatomic,weak)UILabel *nameTitleLabel;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *phoneLabel;

@property(nonatomic,weak)UILabel *addressTitleLabel;
@property(nonatomic,weak)UILabel *addressLabel;
@end
@implementation WDAddressView
-(instancetype)init
{
    if (self =[super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *nameTitleLabel = [[UILabel alloc]init];
        nameTitleLabel.text = @"收 货 人:";
        nameTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        nameTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.nameTitleLabel = nameTitleLabel;
        [self addSubview:nameTitleLabel];
        [nameTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(12);
        }];
        
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"任蕊芳";
        nameLabel.textColor = [UIColor colorWithHexString:@"777777"];
        nameLabel.font  = [UIFont systemFontOfSize:14];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(nameTitleLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(nameTitleLabel.mas_centerY);
        }];
        
        UILabel *phoneLabel = [[UILabel alloc]init];
        phoneLabel.text = @"4498766744";
        phoneLabel.textColor = [UIColor colorWithHexString:@"777777"];
        phoneLabel.font  = [UIFont systemFontOfSize:14];
        self.phoneLabel = phoneLabel;
        [self addSubview:phoneLabel];
        [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(nameLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(nameLabel.mas_centerY);
        }];
        
        
        UILabel *addressTitleLabel = [[UILabel alloc]init];
        addressTitleLabel.text = @"收货地址:";
        addressTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        addressTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.addressTitleLabel = addressTitleLabel;
        [self addSubview:addressTitleLabel];
        [addressTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(nameTitleLabel.mas_bottom).offset(12);
        }];
        
        
        UILabel *addressLabel = [[UILabel alloc]init];
        addressLabel.text = @"北京市海淀区五道口华清嘉园";
        addressLabel.textColor = [UIColor colorWithHexString:@"777777"];
        addressLabel.font  = [UIFont systemFontOfSize:14];
        self.addressLabel = addressLabel;
        [self addSubview:addressLabel];
        [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(addressTitleLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(addressTitleLabel.mas_centerY);
        }];

    }
    return self;
}
@end
@interface WDOrderDetailHeadView ()
@property(nonatomic,weak)WDOrderStateView *orderStateView;
@property(nonatomic,weak)WDAddressView *addressView;
@end
@implementation WDOrderDetailHeadView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
        WDOrderStateView *orderStateView = [[WDOrderStateView alloc]init];
        self.orderStateView = orderStateView;
        [self addSubview:orderStateView];
        [orderStateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(90);
        }];
        
        WDAddressView *addressView = [[WDAddressView alloc]init];
        self.addressView = addressView;
        [self addSubview:addressView];
        [addressView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(80);
            make.top.mas_equalTo(orderStateView.mas_bottom).offset(10);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return self;
}
@end
