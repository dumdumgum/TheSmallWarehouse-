//
//  WaterViewController.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/11.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "WaterViewController.h"
#import "YLLHeader.h"
#import "WaterTableViewCell.h"
@interface WaterViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) WaterTableViewCell *cell;
@property (nonatomic, strong) UITableView *waterTableView;

@end

@implementation WaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    self.waterTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 200) style:(UITableViewStylePlain)];
    self.waterTableView.rowHeight = 50;
    [self.view addSubview:self.waterTableView];
    self.waterTableView.dataSource = self;
    self.waterTableView.delegate = self;
    self.waterTableView.scrollEnabled = NO;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cell = [[WaterTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"waterCell"];
    NSArray *array = [NSArray array];
    array = @[@"仓       库：",@"商       品：",@"开始日期：",@"结束日期："];
    self.cell.lable1.text = array[indexPath.row];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellAction)];
    [self.cell.lable2 addGestureRecognizer:tap];
    return self.cell;
}

- (void)cellAction {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
