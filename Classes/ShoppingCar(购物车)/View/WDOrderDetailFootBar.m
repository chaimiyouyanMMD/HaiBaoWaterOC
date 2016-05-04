//
//  WDOrderDetailFootBar.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/20.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDOrderDetailFootBar.h"
@interface WDOrderDetailFootBar()
@property(nonatomic,weak)UIButton *deleteBtn;
@property(nonatomic,weak)UIButton *serviceBtn;
@property(nonatomic,weak)UIButton *comfirmBtn;

@end
@implementation WDOrderDetailFootBar
-(instancetype)init
{
    if(self = [super init]){
        self.backgroundColor = [UIColor whiteColor];
        UIButton *deleteBtn = [[UIButton alloc]init];
        [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
        [deleteBtn setImage:[UIImage imageNamed:@"btn_delete"] forState:UIControlStateNormal];
        deleteBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [deleteBtn sizeToFit];
        self.deleteBtn = deleteBtn;
        [self addSubview:deleteBtn];
        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        
        UIButton *serviceBtn = [[UIButton alloc]init];
        [serviceBtn setTitle:@"客服" forState:UIControlStateNormal];
        [serviceBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
        [serviceBtn setImage:[UIImage imageNamed:@"icon_call"] forState:UIControlStateNormal];
        serviceBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [serviceBtn sizeToFit];
        self.serviceBtn = serviceBtn;
        [self addSubview:serviceBtn];
        [serviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(deleteBtn.mas_right).offset(20);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        
        UIButton *comfirmBtn = [[UIButton alloc]init];
        [comfirmBtn setTitle:@"确认收货" forState:UIControlStateNormal];
        [comfirmBtn setTitleColor:[UIColor colorWithHexString:@"44a4ef"] forState:UIControlStateNormal];
        [comfirmBtn setBackgroundImage:[UIImage imageNamed:@"home_bg1"] forState:UIControlStateNormal];
        comfirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [comfirmBtn sizeToFit];
        self.comfirmBtn = comfirmBtn;
        [self addSubview:comfirmBtn];
        [comfirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(30);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    return self;
}


@end
