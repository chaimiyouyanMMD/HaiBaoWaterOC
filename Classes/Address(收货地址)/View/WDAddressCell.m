//
//  WDAddressCell.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDAddressCell.h"
#import "WDAddressModel.h"
@interface WDAddressCell ()
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *phoneLabel;
@property(nonatomic,weak)UILabel *addrLabel;
@end
@implementation WDAddressCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        /**
         *  名字
         */
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.textColor = [UIColor colorWithHexString:@"333333"];
        nameLabel.font = [UIFont systemFontOfSize:14];
        [nameLabel sizeToFit];
        self.nameLabel = nameLabel;
        [self.contentView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(8);
        }];
        
        /**
         *  电话
         */
        UILabel *phoneLabel = [[UILabel alloc]init];
        phoneLabel.text = @"17600860481";
        phoneLabel.textColor = [UIColor colorWithHexString:@"999999"];
        phoneLabel.font = [UIFont systemFontOfSize:13];
        [phoneLabel sizeToFit];
        self.phoneLabel = phoneLabel;
        [self.contentView addSubview:phoneLabel];
        [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(nameLabel.mas_right).offset(12);
            make.centerY.mas_equalTo(nameLabel.mas_centerY);
        }];
        
        /**
         *  地址
         */
        UILabel *addrLabel = [[UILabel alloc]init];
        addrLabel.text = @"北京海淀区五道口华清嘉园";
        addrLabel.textColor = [UIColor colorWithHexString:@"777777"];
        addrLabel.font = [UIFont systemFontOfSize:14];
        [addrLabel sizeToFit];
        addrLabel.numberOfLines = 2;
        self.addrLabel = addrLabel;
        [self addSubview:addrLabel];
        [addrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(nameLabel.mas_bottom).offset(6);
            make.right.mas_equalTo(-12);
        }];
        
        UIButton *defauleBtn = [[UIButton alloc]init];
        [defauleBtn setTitle:@"设为默认" forState:UIControlStateNormal];
        [defauleBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
        [defauleBtn setImage:[UIImage imageNamed:@"icon_duihao_gray"] forState:UIControlStateNormal];
        [defauleBtn setImage:[UIImage imageNamed:@"icon_duihao_red"] forState:UIControlStateSelected];
        defauleBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [defauleBtn sizeToFit];
        self.defauleBtn = defauleBtn;
        [self addSubview:defauleBtn];
        [defauleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.bottom.mas_equalTo(-8);
        }];
        
        UIButton *deleteBtn = [[UIButton alloc]init];
        [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
        [deleteBtn setImage:[UIImage imageNamed:@"btn_delete"] forState:UIControlStateNormal];
        deleteBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [deleteBtn sizeToFit];
        self.deleteBtn = deleteBtn;
        [self addSubview:deleteBtn];
        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.bottom.mas_equalTo(-12);
            make.centerY.mas_equalTo(defauleBtn.mas_centerY);
        }];
        
        UIButton *editBtn = [[UIButton alloc]init];
        [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [editBtn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
        [editBtn setImage:[UIImage imageNamed:@"btn_edit"] forState:UIControlStateNormal];
        editBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [editBtn sizeToFit];
        self.editBtn = editBtn;
        [self addSubview:editBtn];
        [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(deleteBtn.mas_left).offset(-12);
            make.centerY.mas_equalTo(defauleBtn.mas_centerY);
        }];
    }
    return self;
}
-(void)setAddrM:(WDAddressModel *)addrM
{
    _addrM = addrM;
    self.nameLabel.text = addrM.recieve_name;
    self.phoneLabel.text = addrM.phone_num;
    self.addrLabel.text = addrM.fullAddress;
}
@end
