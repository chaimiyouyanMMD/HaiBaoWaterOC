//
//  WDConfirmOrderFootView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/9.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDConfirmOrderFootView.h"
@interface WDConfirmOrderTicketView : UIControl
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;
@end
@implementation WDConfirmOrderTicketView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"水票抵用";
        titleLabel.textColor = [UIColor colorWithHexString:@"33333"];
        titleLabel.font = [UIFont systemFontOfSize:14];
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.offset(12);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        
        UILabel *subTitleLabel = [[UILabel alloc]init];
        subTitleLabel.text = @"2.00yuan";
        subTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        subTitleLabel.font = [UIFont systemFontOfSize:12];
        [subTitleLabel sizeToFit];
        self.subTitleLabel = subTitleLabel;
        [self addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).with.offset(-12);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
    }
    return self;
}


@end
@interface WDConfirmOrderTotalPriceView : UIControl
@property(nonatomic,weak)UILabel *priceLabel;
@property(nonatomic,weak)UILabel *totalTitleLabel;
@property(nonatomic,weak)UILabel *totalNumLabel;
@end
@implementation WDConfirmOrderTotalPriceView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.text = @"￥23.00";
        priceLabel.textColor = [UIColor redColor];
        priceLabel.font = [UIFont systemFontOfSize:14];
        [priceLabel sizeToFit];
        self.priceLabel = priceLabel;
        [self addSubview:priceLabel];
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).with.offset(-12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        UILabel *totalTitleLabel = [[UILabel alloc]init];
        totalTitleLabel.text = @"合计:";
        totalTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        totalTitleLabel.font = [UIFont systemFontOfSize:14];
        [totalTitleLabel sizeToFit];
        self.totalTitleLabel = totalTitleLabel;
        [self addSubview:totalTitleLabel];
        [totalTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(priceLabel.mas_left).offset(-6);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        UILabel *totalNumLabel = [[UILabel alloc]init];
        totalNumLabel.text = @"共2件商品";
        totalNumLabel.textColor = [UIColor colorWithHexString:@"777777"];
        totalNumLabel.font = [UIFont systemFontOfSize:14];
        [totalNumLabel sizeToFit];
        self.totalNumLabel = totalNumLabel;
        [self addSubview:totalNumLabel];
        [totalNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(totalTitleLabel.mas_left).offset(-6);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    
    return self;
}


@end

@interface WDConfirmOrderFootView ()
@property(nonatomic,weak)WDConfirmOrderTicketView *costView;
@property(nonatomic,weak)WDConfirmOrderTicketView *ticketView;
@property(nonatomic,weak)WDConfirmOrderTicketView *preferentialView;
@property(nonatomic,weak)WDConfirmOrderTotalPriceView *totalPriceLabel;

@end
@implementation WDConfirmOrderFootView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
        WDConfirmOrderTicketView *costView = [[WDConfirmOrderTicketView alloc]init];
        costView.titleLabel.text = @"快递费用:";
        costView.subTitleLabel.text = @"0.00元";
        self.costView = costView;
        [self addSubview:costView];
        [costView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(self).with.offset(0);
            make.height.mas_equalTo(44);
        }];
        
        
        WDConfirmOrderTicketView *ticketView = [[WDConfirmOrderTicketView alloc]init];
        ticketView.titleLabel.text = @"水票费用:";
        ticketView.subTitleLabel.text = @"0.00元";
        self.ticketView = ticketView;
        [self addSubview:ticketView];
        [ticketView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self).with.offset(0);
            make.height.mas_equalTo(44);
            make.top.mas_equalTo(costView.mas_bottom).offset(0.5);
        }];

        WDConfirmOrderTicketView *preferentialView = [[WDConfirmOrderTicketView alloc]init];
        preferentialView.titleLabel.text = @"代金劵低用:";
        preferentialView.subTitleLabel.text = @"0.00元";
        self.preferentialView = preferentialView;
        [self addSubview:preferentialView];
        [preferentialView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self).with.offset(0);
            make.height.mas_equalTo(44);
            make.top.mas_equalTo(ticketView.mas_bottom).offset(0.5);
        }];
        
        WDConfirmOrderTotalPriceView *totalPriceLabel= [[WDConfirmOrderTotalPriceView alloc]init];
        totalPriceLabel.priceLabel.text = @"￥230.00";
        totalPriceLabel.totalNumLabel.text = @"共11件商品";
        self.totalPriceLabel = totalPriceLabel;
        [self addSubview:totalPriceLabel];
        [totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self).with.offset(0);
            make.height.mas_equalTo(44);
            make.top.mas_equalTo(preferentialView.mas_bottom).offset(0.5);
            make.bottom.mas_equalTo(self).with.offset(-10);
        }];
        
    }
    return self;
}


@end
