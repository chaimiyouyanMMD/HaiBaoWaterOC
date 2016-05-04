//
//  WDPayControllerViewController.m
//  HaiBaoWaterOC
//
//  Created by HuHuiPay on 16/4/13.
//  Copyright © 2016年 huibei. All rights reserved.
//

#import "WDPayController.h"
#import "WDPayCell.h"
#import "WDPayModel.h"
#import "WDCellSectionModel.h"
@interface WDPayTableHeadView : UIView
@property(nonatomic,weak)UIView *bgView;
@property(nonatomic,weak)UILabel *titleLabel;
@property(nonatomic,weak)UILabel *subTitleLabel;
@end
@implementation WDPayTableHeadView

-(instancetype)init
{
    if (self = [super init]) {
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithHexString:@"f5f5f5"]);
        bgView.layer.borderWidth = 10;
        self.bgView = bgView;
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(-10);
            make.right.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"支付金额";
        titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        UILabel *subTitleLabel = [[UILabel alloc]init];
        subTitleLabel.textColor = [UIColor redColor];
        subTitleLabel.font = [UIFont systemFontOfSize:14];
        self.subTitleLabel = subTitleLabel;
        [self addSubview:subTitleLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    return self;
}

@end

@interface WDPayTableFootView : UIControl
@property(nonatomic,weak)UIButton *payBtn;

@end
@implementation WDPayTableFootView

-(instancetype)init
{
    if (self = [super init]) {
        
        UIButton *payBtn = [[UIButton alloc]init];
        [payBtn setBackgroundImage:[UIImage imageNamed:@"bg_blue"] forState:UIControlStateNormal];
        [payBtn setTitle:@"立即支付" forState:UIControlStateNormal];
        [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        payBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        self.payBtn = payBtn;
        [self addSubview:payBtn];
        [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(12);
            make.right.bottom.mas_equalTo(-12);
            make.height.mas_equalTo(44);
        }];
        
    }
    return self;
}

@end
@interface WDPayController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)WDPayTableHeadView *headView;
@property(nonatomic,weak)WDPayTableFootView *footView;

@property(nonatomic,strong)NSArray *allData;
@end
@implementation WDPayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WDPayCell class] forCellReuseIdentifier:@"WDPayCell"];
    WDPayTableHeadView *headView = [[WDPayTableHeadView alloc]init];
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    self.tableView.tableHeaderView = headView;
    
    
    WDPayTableFootView *footView = [[WDPayTableFootView alloc]init];
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    self.tableView.tableFooterView = footView;
    [self loadData];
}

-(void)loadData{
    WDPayCellSecHeadView *secView = [[WDPayCellSecHeadView alloc]init];
    WDPayModel *huibiM = [WDPayModel payModelWithIcon:@"order_huibi" title:@"汇币支付" subTitle:@"您的账户有0.00汇币"];
    WDPayModel *wechatM = [WDPayModel payModelWithIcon:@"order_WeChat" title:@"微信支付" subTitle:@"单笔最高1000元，每日限额1000元"];
    WDPayModel *alipM = [WDPayModel payModelWithIcon:@"order_PayTreasure" title:@"支付宝支付" subTitle:@"快捷支付限额500元，余额支付限额1万"];
    WDPayModel *yinlianM = [WDPayModel payModelWithIcon:@"order_unionpay" title:@"银联支付" subTitle:@"单笔最高2000元，每日限额5000元"];
    WDCellSectionModel *sec = [WDCellSectionModel sectionWithItems:@[huibiM,wechatM,alipM,yinlianM] secHeadView:secView secHeadHeight:44];
    self.allData = @[sec];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    WDCellSectionModel *secM = self.allData[section];
    return secM.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDCellSectionModel *secM = self.allData[indexPath.section];
    WDPayModel *item = secM.items[indexPath.row];
    WDPayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDPayCell"];
    cell.payM = item;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    WDCellSectionModel *secM = self.allData[section];
    return secM.secHeadView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    WDCellSectionModel *secM = self.allData[section];
    return secM.secHeadHeight;
}
@end
