//
//  BaseTabBarViewController.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/2/27.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//
#import "YLLHeader.h"
#import "BaseTabBarViewController.h"
#import "MainViewController.h"
#import "StockTableViewController.h"
#import "StatTableViewController.h"
#import "SellTableViewController.h"
#import "WarehouseDataBase.h"
#import "GetMoneyDataBase.h"
@interface BaseTabBarViewController ()
@property (nonatomic,strong) MainViewController *mainVC;
@property (nonatomic,strong) StockTableViewController *stockTVC;
@property (nonatomic,strong) StatTableViewController *statTVC;
@property (nonatomic,strong) SellTableViewController *sellTVC;
@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainVC = [[MainViewController alloc] init];
    self.stockTVC = [[StockTableViewController alloc] initWithStyle:(UITableViewStylePlain)];
    self.statTVC = [[StatTableViewController alloc] initWithStyle:(UITableViewStylePlain)];
    self.sellTVC = [[SellTableViewController alloc] initWithStyle:(UITableViewStylePlain)];
    
    [self addChildViewController:self.mainVC title:@"首页" image:@"tabBar"];
    [self addChildViewController:self.stockTVC title:@"库存" image:@"tabBar"];
    [self addChildViewController:self.sellTVC title:@"销售" image:@"tabBar"];
    [self addChildViewController:self.statTVC title:@"统计" image:@"tabBar"];
    self.tabBar.tintColor = [UIColor colorWithRed:0/256.0 green:115/256.0 blue:65/256.0 alpha:1];
    [[WarehouseDataBase shareWarehouseDataBase] createTabeleForSqliteWithName:@"goodsModel"];
    [[GetMoneyDataBase shareGetMoneyDataBase] createTabeleForSqliteWithName:@"getMoney"];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)imageName {
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:childController];
    navC.navigationBar.translucent = NO;
    navC.navigationBar.barTintColor = kColor;
   
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
    [navC.tabBarItem setTitleTextAttributes:dic forState:(UIControlStateNormal)];
   
    navC.tabBarItem.title = title;
    navC.tabBarItem.image = [UIImage imageNamed:imageName];
    [self addChildViewController:navC];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
