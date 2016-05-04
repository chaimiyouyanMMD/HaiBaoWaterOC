//
//  WDPayResultView.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/19.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDPayResultView.h"
@interface WDPayResultView()
@property(nonatomic,weak)UIImageView *iconView;
@property(nonatomic,weak)UILabel *resultLabel;
@property(nonatomic,weak)UIView *lineView;
@property(nonatomic,weak)UILabel *noTitleLabel;
@property(nonatomic,weak)UILabel *noLabel;

@property(nonatomic,weak)UILabel *numTitleLabel;
@property(nonatomic,weak)UILabel *numLabel;

@property(nonatomic,weak)UILabel *paymentTitleLabel;
@property(nonatomic,weak)UILabel *paymentLabel;

@property(nonatomic,weak)UILabel *timeTitleLabel;
@property(nonatomic,weak)UILabel *timeLabel;

@end
@implementation WDPayResultView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.image = [UIImage imageNamed:@"payFailure"];
        self.iconView = iconView;
        [self addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.mas_equalTo(12);
        }];
        
        UILabel *resultLabel = [[UILabel alloc]init];
        resultLabel.text = @"支付失败";
        resultLabel.textColor = [UIColor redColor];
        resultLabel.font  = [UIFont systemFontOfSize:16];
        self.resultLabel = resultLabel;
        [self addSubview:resultLabel];
        [resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconView.mas_right).offset(6);
            make.centerY.mas_equalTo(iconView.mas_centerY);
        }];
        
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
        self.lineView = lineView;
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(iconView.mas_bottom).offset(12);
        }];
        
        UILabel *noTitleLabel = [[UILabel alloc]init];
        noTitleLabel.text = @"交易单号:";
        noTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        noTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.noTitleLabel = noTitleLabel;
        [self addSubview:noTitleLabel];
        [noTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(lineView.mas_bottom).offset(12);
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
        
        
        UILabel *numTitleLabel = [[UILabel alloc]init];
        numTitleLabel.text = @"购买数量:";
        numTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        numTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.numTitleLabel = numTitleLabel;
        [self addSubview:numTitleLabel];
        [numTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(noTitleLabel.mas_bottom).offset(12);
        }];
        
        
        UILabel *numLabel = [[UILabel alloc]init];
        numLabel.text = @"2桶";
        numLabel.textColor = [UIColor colorWithHexString:@"777777"];
        numLabel.font  = [UIFont systemFontOfSize:14];
        self.numLabel = numLabel;
        [self addSubview:numLabel];
        [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(numTitleLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(numTitleLabel.mas_centerY);
        }];
        
        
        UILabel *paymentTitleLabel = [[UILabel alloc]init];
        paymentTitleLabel.text = @"支付方式:";
        paymentTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        paymentTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.paymentTitleLabel = paymentTitleLabel;
        [self addSubview:paymentTitleLabel];
        [paymentTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(numTitleLabel.mas_bottom).offset(12);
        }];
        
        
        UILabel *paymentLabel = [[UILabel alloc]init];
        paymentLabel.text = @"微信支付";
        paymentLabel.textColor = [UIColor colorWithHexString:@"777777"];
        paymentLabel.font  = [UIFont systemFontOfSize:14];
        self.paymentLabel = paymentLabel;
        [self addSubview:paymentLabel];
        [paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(paymentTitleLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(paymentTitleLabel.mas_centerY);
        }];
        
        UILabel *timeTitleLabel = [[UILabel alloc]init];
        timeTitleLabel.text = @"交易时间:";
        timeTitleLabel.textColor = [UIColor colorWithHexString:@"777777"];
        timeTitleLabel.font  = [UIFont systemFontOfSize:14];
        self.timeTitleLabel = timeTitleLabel;
        [self addSubview:timeTitleLabel];
        [timeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.top.mas_equalTo(paymentTitleLabel.mas_bottom).offset(12);
        }];
        
        
        UILabel *timeLabel = [[UILabel alloc]init];
        timeLabel.text = @"2016-02-11";
        timeLabel.textColor = [UIColor colorWithHexString:@"777777"];
        timeLabel.font  = [UIFont systemFontOfSize:14];
        self.timeLabel = timeLabel;
        [self addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(timeTitleLabel.mas_right).offset(6);
            make.centerY.mas_equalTo(timeTitleLabel.mas_centerY);
        }];

    }
    return self;
}
@end
