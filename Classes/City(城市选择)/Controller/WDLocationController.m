//
//  WDLoactionController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/4/1.
//  Copyright (c) 2016年 huibei. All rights reserved.
//

#import "WDLocationController.h"
#import "WDSingleton.h"
#import "WDLocationGroup.h"
#import "WDLocationMgr.h"
#import "WDCityModel.h"
#import "WDLocationHeaderView.h"

@interface WDLocationController ()<UITableViewDataSource,UITableViewDelegate,WDLocationHeaderViewDelegate>
@property(nonatomic,strong)NSMutableArray *groups;
@property(nonatomic,strong)WDLocationMgr *_locationMgr;
@end

@implementation WDLocationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.groups = [NSMutableArray array];
    [self loadData];
}
// 获取城市信息
-(void)loadData
{
    NSArray *cities = [WDSingleton sharedInstance].cities;
    if (cities.count) {
        // 定位城市
        WDLocationGroup *secCurrent = [WDLocationGroup new];
        secCurrent.title = @"定位城市";
        NSMutableString *cityTemp = [NSMutableString stringWithString:self.currentCityName];
        NSString *city = [cityTemp stringByReplacingOccurrencesOfString:@"市" withString:@""];
        NSArray *current = [WDLocationMgr getCitiesByCityName:city];
        secCurrent.locations = current;
        secCurrent.opented = YES;
        [self.groups addObject:secCurrent];
        
        // 热门城市
        WDLocationGroup *secHot = [WDLocationGroup new];
        secHot.title = @"热门城市";
        NSArray *hot = [WDLocationMgr getCitiesByCondition:YES];
        secHot.locations = hot;
        secHot.opented = YES;
        [self.groups addObject:secHot];
        
        // 更多城市
        WDLocationGroup *secMore = [WDLocationGroup new];
        secMore.title = @"更多城市";
        NSArray *more = [WDLocationMgr getCitiesByCondition:NO];
        secMore.locations = more;
        secMore.opented = YES;
        [self.groups addObject:secMore];
        
        [self.tableView reloadData];
    }else{
        // 网络获取
        [WDLocationMgr loadCityListSuccessBlock:^{
            [self reloadData];
        }];
        
    }
}
// 刷新数据
-(void)reloadData
{
    [self loadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    WDLocationGroup *group = self.groups[section];
    return (group.isOpened ? group.locations.count : 0);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDLocationGroup *group = self.groups[indexPath.section];
    WDCityModel *model = group.locations[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDLoactionController"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WDLoactionController"];
    }
    cell.textLabel.text = model.label;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDLocationGroup *group = self.groups[indexPath.section];
    WDCityModel *model = group.locations[indexPath.row];
    [WDSingleton sharedInstance].selectedCityName = model.name;
    self.cityBlock(model.label);
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    WDLocationHeaderView *headView = [WDLocationHeaderView headViewWithTableView:tableView];
    headView.group = self.groups[section];
    headView.delegate = self;
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
-(void)headerViewDidClickedNameView:(WDLocationHeaderView *)headView
{
    [self.tableView reloadData];
}
@end
