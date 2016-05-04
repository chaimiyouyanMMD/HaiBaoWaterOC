//
//  WDSettingController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/29.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define WDSettingControllerCellKey @"WDSettingController"
#import "WDSettingController.h"
#import "WDLoginController.h"
#import "WDMineCell.h"
@interface WDSettingFootView :UIControl
@property(nonatomic,weak)UIButton *exitBtn;
@end

@implementation WDSettingFootView
-(instancetype)init
{
    if (self = [super init]) {
        UIButton *exitBtn = [[UIButton alloc]init];
        [exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [exitBtn setTitleColor:[UIColor colorWithHexString:@"777777"] forState:UIControlStateNormal];
        exitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        exitBtn.userInteractionEnabled = NO;
        [exitBtn sizeToFit];
        self.exitBtn = exitBtn;
        [self addSubview:exitBtn];
        [exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.center);
        }];
    }
    return self;
}
@end
@interface WDSettingController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *allData;
@property(nonatomic,weak)WDSettingFootView *footView;
@end

@implementation WDSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WDMineCell class] forCellReuseIdentifier:WDSettingControllerCellKey];
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    WDSettingFootView *footView = [[WDSettingFootView alloc]init];
    [footView addTarget:self action:@selector(exitClick) forControlEvents:UIControlEventTouchUpInside];
    footView.backgroundColor = [UIColor whiteColor];
    footView.frame = CGRectMake(0, 12, SCREEN_WIDTH, 44);
    self.tableView.tableFooterView = footView;
    
    [self loadData];
}
#pragma mark - 退出登录
-(void)exitClick
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"login" object:nil];
}
- (void)loadData {
    WDCellModel *account = [[WDCellModel alloc]initWithIcon:nil title:@"帐号管理" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *praise = [[WDCellModel alloc]initWithIcon:nil title:@"给海豹点赞" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *opinion = [[WDCellModel alloc]initWithIcon:nil title:@"意见反馈" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    WDCellModel *clear = [[WDCellModel alloc]initWithIcon:nil title:@"清除缓存" subTitle:@"" descVc:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    self.allData = @[@[account],@[praise,opinion],@[clear]];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *items = self.allData[section];
    return items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *items = self.allData[indexPath.section];
    WDCellModel *model = items[indexPath.row];
    WDMineCell *cell = [tableView dequeueReusableCellWithIdentifier:WDSettingControllerCellKey];
    cell.cellM = model;
    cell.accessoryType = model.accessoryType;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
@end
