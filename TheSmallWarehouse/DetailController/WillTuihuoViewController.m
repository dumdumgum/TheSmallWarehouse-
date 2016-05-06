//
//  WillTuihuoViewController.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/18.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "WillTuihuoViewController.h"
#import "YLLHeader.h"
#import "GoodsTableViewController.h"
#import "AllGoodsTableViewCell.h"
@interface WillTuihuoViewController ()
@property (nonatomic, strong) AllGoodsTableViewCell *cell;

@end

@implementation WillTuihuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightBI = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(tapGR)];
    self.navigationItem.rightBarButtonItem = rightBI;
    self.tableView.rowHeight = 125;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tapGR {
 
    GoodsTableViewController *goodsTVC = [[GoodsTableViewController alloc] init];
    [self.navigationController pushViewController:goodsTVC animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cell = [[AllGoodsTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"tuihuoCell"];
    return self.cell;
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
