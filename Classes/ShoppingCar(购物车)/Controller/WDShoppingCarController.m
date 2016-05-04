//
//  WDShoppingCarController.m
//  HaiBaoWaterOC
//
//  Created by huibei on 16/3/28.
//  Copyright (c) 2016年 huibei. All rights reserved.
//
#define cellKey @"WDShoppingCarController"
#import "WDShoppingCarController.h"
#import "WDShoppingCarFootView.h"
#import "WDShoppingCarCell.h"
#import "WDShoppingCarModel.h"
#import "MJExtension.h"
#import "WDShoppingItemCarModel.h"
#import "WDShoppingCarHeadView.h"
#import "UIScrollView+EmptyDataSet.h"
#import "TPKeyboardAvoidingTableView.h"
#import "WDConfirmOrderController.h"

@interface ShoppingCartExtensionItem : NSObject
@property(nonatomic,assign)int itemId;
@property(nonatomic,assign)BOOL selected;
@property(nonatomic,assign)int count;
+(instancetype)itemWithSelected:(BOOL)selected count:(int)count itemId:(int)itemId;

@end
@implementation ShoppingCartExtensionItem
+(instancetype)itemWithSelected:(BOOL)selected count:(int)count itemId:(int)itemId
{
        ShoppingCartExtensionItem *item = [[ShoppingCartExtensionItem alloc]init];
        item.selected = selected;
        item.count = count;
        item.itemId = itemId;
        return item;
}


@end


@interface WDShoppingCarController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)WDShoppingCarFootView *footBar;
@property(nonatomic,strong)NSArray *allData;
@property(nullable,weak)TPKeyboardAvoidingTableView *tableView;
@property(nonatomic,strong)NSMutableArray *productStateDictionaryArray;
@end

@implementation WDShoppingCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    TPKeyboardAvoidingTableView *tableView = [[TPKeyboardAvoidingTableView alloc]init];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.view.backgroundColor = [UIColor blackColor];
    [self.tableView registerClass:[WDShoppingCarCell class] forCellReuseIdentifier:cellKey];
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:tableView];
    if (self.tabBarController.tabBar.hidden) {
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-44);
            make.top.mas_equalTo(0);
            
        }];
    } else {
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(-88);
            
        }];
    }
    
    
    WDShoppingCarFootView *footBar = [[WDShoppingCarFootView alloc]init];
    [footBar.clearingBtn addTarget:self action:@selector(goConfirmOrder) forControlEvents:UIControlEventTouchUpInside];
    self.footBar = footBar;
    [self.view addSubview:footBar];
    [footBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tableView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    [self requestDataWithPageSize:10 pageNo:1 reset:YES];
    [self setNav];
}
#pragma marrk - 编辑
-(void)setNav
{
    UIButton *rightBtn = [[UIButton alloc]init];
    rightBtn.frame = CGRectMake(-60, 0, 60, 32);
    [rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [rightBtn setTitle:@"完成" forState:UIControlStateSelected];
    [rightBtn setTitleColor:[UIColor colorWithHexString:@"44B4ef"] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn addTarget:self action:@selector(editClick:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn sizeToFit];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;

}
#pragma mark - 编辑商品
-(void)editClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    BOOL state = sender.selected;
    [self.tableView setEditing:state animated:YES];
}

#pragma mark - 去确认订单
-(void)goConfirmOrder
{
    WDConfirmOrderController *desc = [[WDConfirmOrderController alloc]init];
    desc.title = @"确认订单";
    [self.navigationController pushViewController:desc animated:YES];
}
#pragma mark - 获取购物车列表
-(void)requestDataWithPageSize:(int)pageSize pageNo:(int)pageNo reset:(BOOL)reset
{
    if ([WDUserTool hasLogin]) {
        WDUserInfo *user = [WDUserTool currentUser];
        
        NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@&%@",[WDHttpRequestTool appSecret],user.access_token_secret]];
        NSDictionary *accessInfo = @{
                                     @"app_key":[WDHttpRequestTool appKey],
                                     @"signature":signature,
                                     @"access_token":user.access_token,
                                     @"phone_num":user.phone_num
                                     };
        NSDictionary *requestPageInfo = @{
                                          @"pageSize":@(pageSize),
                                          @"pageNo":@(pageNo)
                                          };
        NSDictionary *param = @{
                                @"accessInfo":accessInfo,
                                @"requestPageInfo":requestPageInfo,
                                @"sign":@""
                                };
        [WDHttpRequestTool requestWithUrl:@"shoppingcart/list" params:param successBlock:^(id json) {
            if (json != nil) {
            NSArray *list = [WDShoppingCarModel mj_objectArrayWithKeyValuesArray:json[@"cartInfos"]];
            self.allData = list;
            
            }
            self.tableView.emptyDataSetSource = self;
            self.tableView.emptyDataSetDelegate = self;
            [self.tableView reloadData];
            
        }];
    }
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    WDShoppingCarModel *secM = self.allData[section];
    return secM.itemList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDShoppingCarModel *secM = self.allData[indexPath.section];
    WDShoppingItemCarModel *model = secM.itemList[indexPath.row];
    // 获取商品是否选中
    model.selected = [self getProductSelectedWith:model];
    WDShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:cellKey];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
}
#pragma mark - 获取商品的选中状态
-(BOOL)getProductSelectedWith:(WDShoppingItemCarModel *)productModel
{
    int itemId = productModel.itemId;
    
    
    return  YES;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  110;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 刷新购车的cellSec的选中状态
    NSIndexSet *secSet = [[NSIndexSet alloc]initWithIndex:indexPath.section];
    [self.tableView reloadSections:secSet withRowAnimation:UITableViewRowAnimationNone];
    // 刷新购车cell的选中状态
    NSIndexPath *cellPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:cellPath,nil] withRowAnimation:UITableViewRowAnimationNone];

    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    WDShoppingCarModel *model = self.allData[section];
    WDShoppingCarHeadView *headView = [[WDShoppingCarHeadView alloc]init];
    headView.model = model;
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc]init];
    footView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    return footView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deleteShoppingCarWithIndexPath:indexPath];
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat secHeadHeight = 44;
    if (scrollView.contentOffset.y <= secHeadHeight && scrollView.contentOffset.y >= 0 ) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else{
    if (scrollView.contentOffset.y >= secHeadHeight){
        scrollView.contentInset = UIEdgeInsetsMake(-secHeadHeight, 0, 0, 0);
    }
    }
    
}
#pragma mark - 删除购物车的数据
-(void)deleteShoppingCarWithIndexPath:(NSIndexPath *)indexPath
{
    WDShoppingCarModel *secM = self.allData[indexPath.section];
    WDShoppingItemCarModel *model = secM.itemList[indexPath.row];
    if ([WDUserTool hasLogin]) {
        WDUserInfo *user = [WDUserTool currentUser];
        NSString *signature = [WDHttpRequestTool digest:[NSString stringWithFormat:@"%@&%@",[WDHttpRequestTool appSecret],user.access_token_secret]];
        NSDictionary *accessInfo = @{
                                     @"app_key":[WDHttpRequestTool appKey],
                                     @"signature":signature,
                                     @"access_token":user.access_token,
                                     @"phone_num":user.phone_num
                                     };
        int itemId = model.itemId;
        NSDictionary *deleteModel = @{
                                      @"shoppingCartId":@(secM.shoppingCartId),
                                      @"itemIds":@[@(itemId)]
                                      };
        NSDictionary *param = @{
                                @"sign":@"sign",
                                @"accessInfo":accessInfo,
                                @"deleteModels":@[deleteModel],
                                @"accessCheckType":@"check_right_for_user_info",
                                @"accessToken":user.access_token,
                                @"app_key":[WDHttpRequestTool appKey],
                                };
        typeof(self) __weak wself = self ;
        [WDHttpRequestTool requestWithUrl:@"shoppingcart/delete" params:param successBlock:^(id json) {
            [SVProgressHUD showSuccessWithStatus:@"删除成功!"];
            [wself requestDataWithPageSize:10 pageNo:1 reset:YES];
        }];
    }
}
-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"seals"];
}
-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *title = @"您还没有选择的商品!";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:title];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"777777"] range:NSMakeRange(0, 10)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 10)];
    
    return attributedString;
}
-(CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.tabBarController.tabBar.hidden) {
        return -self.view.frame.size.height/6;
    } else {
        return -self.view.frame.size.height/6+22;
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self requestDataWithPageSize:10 pageNo:1 reset:YES];
    [self.tableView reloadData];
}
@end
