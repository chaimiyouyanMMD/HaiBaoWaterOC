//
//  WDConfirmOrderAddrView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/9.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDConfirmOrderAddrView.h"
#import "WDDefaultAddressModel.h"
@interface WDNoAddrView()
@property(nonatomic,weak)UIImageView *addrIcon;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UIImageView *arrowIcon;

@end
@implementation WDNoAddrView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *addrIcon = [[UIImageView alloc]init];
        addrIcon.image = [UIImage imageNamed:@"icon_location_que"];
        self.addrIcon = addrIcon;
        [self addSubview:addrIcon];
        [addrIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.offset(12);
            make.size.mas_equalTo(CGSizeMake(12, 15));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
      
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"新增地址:";
        titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        titleLabel.font = [UIFont systemFontOfSize:14];
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(addrIcon.mas_right).offset(6);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        UIImageView *arrowIcon = [[UIImageView alloc]init];
        arrowIcon.image = [UIImage imageNamed:@"btn_right_arrow"];
        self.arrowIcon = arrowIcon;
        [self addSubview:arrowIcon];
        [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(8, 12));
            make.right.mas_equalTo(self).with.offset(-12);
            
        }];

    }
    return  self;
}
@end
@interface WDAddrView ()
@property(nonatomic,weak)UILabel *nameTitleLabel;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *phoneLabel;
@property(nonatomic,weak)UILabel *addrTitleLabel;
@property(nonatomic,weak)UILabel *addrLabel;
@property(nonatomic,weak)UIButton *defaultBtn;

@end
@implementation WDAddrView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *nameTitleLabel = [[UILabel alloc]init];
        nameTitleLabel.text = @"收货人:";
        nameTitleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameTitleLabel.font = [UIFont systemFontOfSize:14];
        [nameTitleLabel sizeToFit];
        self.nameTitleLabel = nameTitleLabel;
        [self addSubview:nameTitleLabel];
        [nameTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.offset(12);
            make.top.mas_equalTo(self).with.offset(12);
        }];
        
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.textColor = [UIColor colorWithHexString:@"999999"];
        nameLabel.font = [UIFont systemFontOfSize:13];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.offset(60);
            make.top.mas_equalTo(self).with.offset(12);
        }];

        
        
        UILabel *phoneLabel = [[UILabel alloc]init];
        phoneLabel.text = @"17600850481";
        phoneLabel.textColor = [UIColor colorWithHexString:@"999999"];
        phoneLabel.font = [UIFont systemFontOfSize:13];
        [phoneLabel sizeToFit];
        self.phoneLabel = phoneLabel;
        [self addSubview:phoneLabel];
        [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).with.offset(-6);
            make.top.mas_equalTo(self).with.offset(12);
        }];
        
        
        UILabel *addrTitleLabel = [[UILabel alloc]init];
        addrTitleLabel.text = @"收货地址:";
        addrTitleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        addrTitleLabel.font = [UIFont systemFontOfSize:14];
        [addrTitleLabel sizeToFit];
        self.addrTitleLabel = addrTitleLabel;
        [self addSubview:addrTitleLabel];
        [addrTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.offset(12);
            make.top.mas_equalTo(nameTitleLabel.mas_bottom).with.offset(12);
            
        }];
        
        UIButton *defaultBtn = [[UIButton alloc]init];
        [defaultBtn setTitle:@"默认" forState:UIControlStateNormal];
        [defaultBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [defaultBtn setBackgroundImage:[UIImage imageNamed:@"btn_redBg"] forState:UIControlStateNormal];
        defaultBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [defaultBtn sizeToFit];
        self.defaultBtn = defaultBtn;
        [self addSubview:defaultBtn];
        [defaultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(addrTitleLabel.mas_centerY);
            make.left.mas_equalTo(addrTitleLabel.mas_right).offset(6);
            make.size.mas_equalTo(CGSizeMake(30, 18));
        }];
        
       
       
        UILabel *addrLabel = [[UILabel alloc]init];
        addrLabel.text = @"北京市海淀区五道口华清嘉园1208";
        addrLabel.textColor = [UIColor colorWithHexString:@"777777"];
        addrLabel.font = [UIFont systemFontOfSize:13];
        [addrLabel sizeToFit];
        addrLabel.numberOfLines = 2;
        self.addrLabel = addrLabel;
        [self addSubview:addrLabel];
        [addrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(defaultBtn.mas_right).offset(6);
            make.centerY.mas_equalTo(addrTitleLabel.mas_centerY);
            make.right.mas_lessThanOrEqualTo(-6);
        }];
        
    }
    return self;
}

@end
@interface WDDistributionView : UIView
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UIButton *timeBtn;
@property(nonatomic,weak)UILabel *timeLabel;
@property(nonatomic,weak)UIImageView *arrowIcon;

@end
@implementation WDDistributionView
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"配送时间:";
        titleLabel.textColor = [UIColor colorWithHexString:@"33333"];
        titleLabel.font = [UIFont systemFontOfSize:14];
        [titleLabel sizeToFit];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).with.offset(12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        UIButton *timeBtn = [[UIButton alloc]init];
        [timeBtn setTitle:@"2hours" forState:UIControlStateNormal];
        [timeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [timeBtn setBackgroundImage:[UIImage imageNamed:@"btn_redBg"] forState:UIControlStateNormal];
        timeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [timeBtn sizeToFit];
        self.timeBtn = timeBtn;
        [self addSubview:timeBtn];
        [timeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 18));
            make.centerY.equalTo(titleLabel.mas_centerY);
            make.left.equalTo(titleLabel.mas_right).with.offset(6);
        }];
        
        UIImageView *arrowIcon = [[UIImageView alloc]init];
        arrowIcon.image = [UIImage imageNamed:@"btn_right_arrow"];
        self.arrowIcon = arrowIcon;
        [self addSubview:arrowIcon];
        [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(8, 12));
            make.right.mas_equalTo(-12);
            
        }];
        
        
        UILabel *timeLabel = [[UILabel alloc]init];
        timeLabel.text = @"工作时间2小时内";
        timeLabel.textColor = [UIColor colorWithHexString:@"777777"];
        timeLabel.font = [UIFont systemFontOfSize:13];
        [timeLabel sizeToFit];
        self.timeLabel = timeLabel;
        [self addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.mas_lessThanOrEqualTo(arrowIcon.mas_left).offset(-6);
            make.left.mas_equalTo(timeBtn.mas_right).with.offset(6);
        }];
    }
    return self;
}

@end
@interface WDConfirmOrderAddrView ()

@end
@implementation WDConfirmOrderAddrView

-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
        
        WDNoAddrView *noAddrView = [[WDNoAddrView alloc]init];
        self.noAddrView = noAddrView;
        [self addSubview:noAddrView];
        [noAddrView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(self).with.offset(0);
            make.height.mas_equalTo(48);
        }];

        
        WDAddrView *addrView = [[WDAddrView alloc]init];
        self.addrView = addrView;
        [self addSubview:addrView];
        
        
        WDDistributionView *distributionView = [[WDDistributionView alloc]init];
        self.distributionView = distributionView;
        [self addSubview:distributionView];
        [distributionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self).with.offset(0);
            make.height.mas_equalTo(44);
            make.top.equalTo(noAddrView.mas_bottom).offset(12);
            make.bottom.mas_equalTo(self).with.offset(-12);
        }];
    }
    return self;
}
-(void)setAddrM:(WDDefaultAddressModel *)addrM
{
    _addrM = addrM;
    self.addrView.hidden = NO;
    self.noAddrView.hidden = YES;
    [self.addrView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self).with.offset(0);
        make.height.equalTo(@100);
    }];
    [self.distributionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addrView.mas_bottom).offset(12);
    }];
    self.addrView.nameLabel.text = addrM.userName;
    self.addrView.phoneLabel.text = addrM.mobile;
    self.addrView.addrLabel.text = addrM.fullAddress;

    
}
@end
