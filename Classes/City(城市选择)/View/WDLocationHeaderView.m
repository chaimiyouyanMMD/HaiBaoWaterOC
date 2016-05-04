//
//  WDLocationHeaderView.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDLocationHeaderView.h"
#import "WDLocationGroup.h"
@interface WDLocationHeaderView()
@property(nonatomic,weak)UIButton *nameBtn;
@property(nonatomic,weak)UIView *line;

@end
@implementation WDLocationHeaderView

+(instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *headCellKey = @"WDLocationHeaderView";
    WDLocationHeaderView *headView = [tableView dequeueReusableCellWithIdentifier:headCellKey];
    if (headView == nil) {
        headView = [[WDLocationHeaderView alloc]initWithReuseIdentifier:headCellKey];
    }
    return headView;
}
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *nameBtn = [[UIButton alloc]init];
        [nameBtn sizeToFit];
        nameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [nameBtn addTarget:self action:@selector(nameBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [nameBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
        self.nameBtn = nameBtn;
        [self.contentView addSubview:nameBtn];
        
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor lightGrayColor];
        line.alpha = 0.3;
        self.line = line;
        [self.contentView addSubview:line];
        

    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.nameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.bottom.mas_equalTo(-1);
        make.top.mas_equalTo(0);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}
-(void)setGroup:(WDLocationGroup *)group
{
    _group = group;
    [self.nameBtn setTitle:group.title forState:UIControlStateNormal];
}
// 监听按钮的点击
-(void)nameBtnClick
{
    // 1.修改组模型的标记
    self.group.opented = !self.group.isOpened;
    
    // 刷新表格
    if([self.delegate respondsToSelector:@selector(headerViewDidClickedNameView:)]){
        [self.delegate headerViewDidClickedNameView:self];
    }
    
}
@end
