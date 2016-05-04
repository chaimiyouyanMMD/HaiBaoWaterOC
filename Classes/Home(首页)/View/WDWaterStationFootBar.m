//
//  WDWaterStationFootBar.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/7.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDWaterStationFootBar.h"
#import "WDButton.h"
@interface WDProductDetailFootBar()

@end
@implementation WDProductDetailFootBar
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"4a5156"];
        UIButton *addBtn = [[UIButton alloc]init];
        [addBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        [addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [addBtn setBackgroundColor:[UIColor colorWithHexString:@"f12f2f"]];
        addBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [addBtn sizeToFit];
        self.addBtn = addBtn;
        [self addSubview:addBtn];
        [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(90);
            make.bottom.top.mas_equalTo(0);
        }];
        
        WDButton *serviceBtn = [[WDButton alloc]init];
        serviceBtn.titleLabel.text = @"客服";
        serviceBtn.titleLabel.textColor = [UIColor whiteColor];
        serviceBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        serviceBtn.iconView.image = [UIImage imageNamed:@"btn_tel"];
        [serviceBtn sizeToFit];
        self.serviceBtn = serviceBtn;
        [self addSubview:serviceBtn];
        [serviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);
            
        }];
        
        WDButton *merchantBtn = [[WDButton alloc]init];
        merchantBtn.titleLabel.text = @"店铺";
        merchantBtn.titleLabel.textColor = [UIColor whiteColor];
        merchantBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        merchantBtn.iconView.image = [UIImage imageNamed:@"btn_store"];
        [merchantBtn sizeToFit];
        self.merchantBtn = merchantBtn;
        [self addSubview:merchantBtn];
        [merchantBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(serviceBtn.mas_right).offset(0);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);
            make.width.mas_equalTo(serviceBtn.mas_width);

            
        }];
        
        WDButton *collectionBtn = [[WDButton alloc]init];
        collectionBtn.titleLabel.text = @"收藏";
        collectionBtn.titleLabel.textColor = [UIColor whiteColor];
        collectionBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        collectionBtn.iconView.image = [UIImage imageNamed:@"tab_btn_collect"];
        [collectionBtn sizeToFit];
        self.collectionBtn = collectionBtn;
        [self addSubview:collectionBtn];
        [collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(merchantBtn.mas_right).offset(0);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);
            make.width.mas_equalTo(merchantBtn.mas_width);
            
        }];
        
        WDButton *shoppingCarBtn = [[WDButton alloc]init];
        shoppingCarBtn.titleLabel.text = @"购物车";
        shoppingCarBtn.titleLabel.textColor = [UIColor whiteColor];
        shoppingCarBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        shoppingCarBtn.iconView.image = [UIImage imageNamed:@"tab_btn_shoppingcart"];
        [shoppingCarBtn sizeToFit];
        self.shoppingCarBtn = shoppingCarBtn;
        [self addSubview:shoppingCarBtn];
        [shoppingCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(collectionBtn.mas_right).offset(0);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);
            make.width.mas_equalTo(collectionBtn.mas_width);
            make.right.mas_equalTo(addBtn.mas_left).offset(0);
            
        }];

        
        
        
        
    }
    return self;
}
@end


@implementation WDTicketDetailFootBar
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"4a5156"];
        UIButton *addShoppingCarBtn = [[UIButton alloc]init];
        [addShoppingCarBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        [addShoppingCarBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [addShoppingCarBtn setBackgroundColor:[UIColor redColor]];
        addShoppingCarBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [addShoppingCarBtn sizeToFit];
        self.addShoppingCarBtn = addShoppingCarBtn;
        [self addSubview:addShoppingCarBtn];
        [addShoppingCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(110);
            make.bottom.top.mas_equalTo(0);
        }];
        
        WDButton *serviceBtn = [[WDButton alloc]init];
        serviceBtn.titleLabel.text = @"客服";
        serviceBtn.titleLabel.textColor = [UIColor whiteColor];
        serviceBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        serviceBtn.iconView.image = [UIImage imageNamed:@"btn_tel"];
        [serviceBtn sizeToFit];
        self.serviceBtn = serviceBtn;
        [self addSubview:serviceBtn];
        [serviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);
            
        }];
        
        
        WDButton *collectionBtn = [[WDButton alloc]init];
        collectionBtn.titleLabel.text = @"收藏";
        collectionBtn.titleLabel.textColor = [UIColor whiteColor];
        collectionBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        collectionBtn.iconView.image = [UIImage imageNamed:@"tab_btn_collect"];
        [collectionBtn sizeToFit];
        self.collectionBtn = collectionBtn;
        [self addSubview:collectionBtn];
        [collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(serviceBtn.mas_right).offset(0);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);
            make.width.mas_equalTo(serviceBtn.mas_width);
            
        }];
        
        WDButton *shoppingCarBtn = [[WDButton alloc]init];
        shoppingCarBtn.titleLabel.text = @"购物车";
        shoppingCarBtn.titleLabel.textColor = [UIColor whiteColor];
        shoppingCarBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        shoppingCarBtn.iconView.image = [UIImage imageNamed:@"tab_btn_shoppingcart"];
        [shoppingCarBtn sizeToFit];
        self.shoppingCarBtn = shoppingCarBtn;
        [self addSubview:shoppingCarBtn];
        [shoppingCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(collectionBtn.mas_right).offset(0);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);
            make.width.mas_equalTo(collectionBtn.mas_width);
            make.right.mas_equalTo(addShoppingCarBtn.mas_left).offset(0);
            
        }];

        
       
    }
    return self;
}
@end
@interface WDWaterStationFootBar ()

@end
@implementation WDWaterStationFootBar
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"4a5156"];
        UIButton *clearBtn = [[UIButton alloc]init];
        [clearBtn setTitle:@"去结算" forState:UIControlStateNormal];
        [clearBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clearBtn setBackgroundColor:[UIColor colorWithHexString:@"f12f2f"]];
        clearBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [clearBtn sizeToFit];
        self.clearBtn = clearBtn;
        [self addSubview:clearBtn];
        [clearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(110);
            make.bottom.top.mas_equalTo(0);
        }];
        
        WDButton *serviceBtn = [[WDButton alloc]init];
        serviceBtn.titleLabel.text = @"客服";
        serviceBtn.titleLabel.textColor = [UIColor whiteColor];
        serviceBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        serviceBtn.iconView.image = [UIImage imageNamed:@"btn_tel"];
        [serviceBtn sizeToFit];
        self.serviceBtn = serviceBtn;
        [self addSubview:serviceBtn];
        [serviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);

        }];
        
        
        WDButton *collectionBtn = [[WDButton alloc]init];
        collectionBtn.titleLabel.text = @"收藏";
        collectionBtn.titleLabel.textColor = [UIColor whiteColor];
        collectionBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        collectionBtn.iconView.image = [UIImage imageNamed:@"tab_btn_collect"];
        [collectionBtn sizeToFit];
        self.collectionBtn = collectionBtn;
        [self addSubview:collectionBtn];
        [collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(serviceBtn.mas_right).offset(0);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);
            make.width.mas_equalTo(serviceBtn.mas_width);
            
            
        }];
        
        WDButton *shoppingCarBtn = [[WDButton alloc]init];
        shoppingCarBtn.titleLabel.text = @"购物车";
        shoppingCarBtn.titleLabel.textColor = [UIColor whiteColor];
        shoppingCarBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        shoppingCarBtn.iconView.image = [UIImage imageNamed:@"tab_btn_shoppingcart"];
        [shoppingCarBtn sizeToFit];
        self.shoppingCarBtn = shoppingCarBtn;
        [self addSubview:shoppingCarBtn];
        [shoppingCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(collectionBtn.mas_right).offset(0);
            make.top.mas_equalTo(4);
            make.bottom.mas_equalTo(-4);
            make.width.mas_equalTo(collectionBtn.mas_width);
            make.right.mas_equalTo(clearBtn.mas_left).offset(0);
        }];
        

        
       
    }
    return self;
}
@end
