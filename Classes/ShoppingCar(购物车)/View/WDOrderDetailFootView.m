//
//  WDOrderDetailFootView.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/19.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDOrderDetailFootView.h"
@interface WDPaymentView:UIView
@property(nonatomic,weak)UILabel *payTitleLabel;
@property(nonatomic,weak)UILabel *paymentLabel;
@end
@implementation WDPaymentView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor  = [UIColor whiteColor];
        UILabel *payTitleLabel = [[UILabel alloc]init];
        payTitleLabel.text = @"支付方式";
        payTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        payTitleLabel.font = [UIFont systemFontOfSize:14];
        [payTitleLabel sizeToFit];
        self.payTitleLabel = payTitleLabel;
        [self addSubview:payTitleLabel];
        [payTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        
        
        UILabel *paymentLabel = [[UILabel alloc]init];
        paymentLabel.text = @"支付宝";
        paymentLabel.textColor = [UIColor colorWithHexString:@"777777"];
        paymentLabel.font = [UIFont systemFontOfSize:14];
        [paymentLabel sizeToFit];
        self.paymentLabel = paymentLabel;
        [self addSubview:paymentLabel];
        [paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    return self;
}


@end
@interface WDOrderDetailInfoView : UIView
@property(nonatomic,weak)UILabel *totalTitleLabel;
@property(nonatomic,weak)UILabel *totalLabel;

@property(nonatomic,weak)UILabel *courierTitleLabel;
@property(nonatomic,weak)UILabel *courierLabel;

@property(nonatomic,weak)UILabel *ticketTitleLabel;
@property(nonatomic,weak)UILabel *ticketLabel;

@property(nonatomic,weak)UILabel *daijinjuanTitleLabel;
@property(nonatomic,weak)UILabel *daijinjuanLabel;

@property(nonatomic,weak)UIView *line;


@property(nonatomic,weak)UILabel *actualTitleLabel;
@property(nonatomic,weak)UILabel *actualLabel;
@end
@implementation WDOrderDetailInfoView
-(instancetype)init
{
    
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *totalTitleLabel = [[UILabel alloc]init];
        totalTitleLabel.text = @"订单金额:";
        totalTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        totalTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.totalTitleLabel = totalTitleLabel;
        [self addSubview:totalTitleLabel];
        [totalTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(12);
        }];
        
        UILabel *totalLabel = [[UILabel alloc]init];
        totalLabel.text = @"￥23.00";
        totalLabel.textColor = [UIColor redColor];
        totalLabel.font  = [UIFont systemFontOfSize:14];
        self.totalLabel = totalLabel;
        [self addSubview:totalLabel];
        [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(totalTitleLabel.mas_centerY);
        }];
        
        
        UILabel *courierTitleLabel = [[UILabel alloc]init];
        courierTitleLabel.text = @"快递费用:";
        courierTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        courierTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.courierTitleLabel = courierTitleLabel;
        [self addSubview:courierTitleLabel];
        [courierTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(totalTitleLabel.mas_bottom).offset(12);
        }];
        
        
        UILabel *courierLabel = [[UILabel alloc]init];
        courierLabel.text = @"￥0.00";
        courierLabel.textColor = [UIColor redColor];
        courierLabel.font  = [UIFont systemFontOfSize:14];
        self.courierLabel = courierLabel;
        [self addSubview:courierLabel];
        [courierLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(courierTitleLabel.mas_centerY);
        }];
        
        
        UILabel *ticketTitleLabel = [[UILabel alloc]init];
        ticketTitleLabel.text = @"水票抵用:";
        ticketTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        ticketTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.ticketTitleLabel = ticketTitleLabel;
        [self addSubview:ticketTitleLabel];
        [ticketTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(courierTitleLabel.mas_bottom).offset(12);
        }];
        
        
        UILabel *ticketLabel = [[UILabel alloc]init];
        ticketLabel.text = @"0张";
        ticketLabel.textColor = [UIColor redColor];
        ticketLabel.font  = [UIFont systemFontOfSize:14];
        self.ticketLabel = ticketLabel;
        [self addSubview:ticketLabel];
        [ticketLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(ticketTitleLabel.mas_centerY);
        }];
        
        UILabel *daijinjuanTitleLabel = [[UILabel alloc]init];
        daijinjuanTitleLabel.text = @"代金券:";
        daijinjuanTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        daijinjuanTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.daijinjuanTitleLabel = daijinjuanTitleLabel;
        [self addSubview:daijinjuanTitleLabel];
        [daijinjuanTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(ticketTitleLabel.mas_bottom).offset(12);
        }];
        
        
        UILabel *daijinjuanLabel = [[UILabel alloc]init];
        daijinjuanLabel.text = @"￥0.00";
        daijinjuanLabel.textColor = [UIColor redColor];
        daijinjuanLabel.font  = [UIFont systemFontOfSize:14];
        self.daijinjuanLabel = daijinjuanLabel;
        [self addSubview:daijinjuanLabel];
        [daijinjuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(daijinjuanTitleLabel.mas_centerY);
        }];
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
        self.line = line;
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(daijinjuanTitleLabel.mas_bottom).offset(12);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
        
        
        UILabel *actualLabel = [[UILabel alloc]init];
        actualLabel.text = @"￥23.00";
        actualLabel.textColor = [UIColor redColor];
        actualLabel.font  = [UIFont systemFontOfSize:14];
        self.actualLabel = daijinjuanTitleLabel;
        [self addSubview:actualLabel];
        [actualLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.top.mas_equalTo(line.mas_bottom).offset(12);
        }];
        
        
        UILabel *actualTitleLabel = [[UILabel alloc]init];
        actualTitleLabel.text = @"实付款:";
        actualTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        actualTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.actualTitleLabel = actualTitleLabel;
        [self addSubview:actualTitleLabel];
        [actualTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(actualLabel.mas_left).offset(-6);
            make.centerY.mas_equalTo(actualLabel.mas_centerY);
        }];

    }
    return self;
    
}

@end
@interface WDOrderDetailFootView ()

@property(nonatomic,weak)WDOrderDetailInfoView *infoView;
@property(nonatomic,weak)WDPaymentView *paymentView;
@end
@implementation WDOrderDetailFootView
-(instancetype)init
{
    
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
        WDOrderDetailInfoView *infoView = [[WDOrderDetailInfoView alloc]init];
        self.infoView = infoView;
        [self addSubview:infoView];
        [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(170);
        }];
        
        
        
        WDPaymentView *paymentView = [[WDPaymentView alloc]init];
        self.paymentView = paymentView;
        [self addSubview:paymentView];
        [paymentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(infoView.mas_bottom).offset(10);
            make.height.mas_equalTo(44);
        }];
    }
    return self;
}

@end
