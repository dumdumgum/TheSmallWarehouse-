//
//  StockTableViewController.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/2/27.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "StockTableViewController.h"
#import "CommonTableViewCell.h"
#import "IntoWarehouseViewController.h"
#import "AllGoodsViewController.h"
#import "WaterViewController.h"
#import "TuiHuoViewController.h"
@interface StockTableViewController ()
@property (nonatomic,retain) NSArray *stockArray;
@property (nonatomic,retain) NSArray *imgArray;
@end

@implementation StockTableViewController

- (NSArray *)stockArray {
    if (!_stockArray) {
        _stockArray = [[NSArray alloc] init];
    }
    return _stockArray;
}
- (NSArray *)imgArray {
    if (!_imgArray) {
        _imgArray = [[NSArray alloc] init];
    }
    return _imgArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"库存";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[CommonTableViewCell class] forCellReuseIdentifier:@"kucun"];
    self.tableView.rowHeight = 60;
    self.tableView.scrollEnabled = NO;

    self.stockArray = @[@"库存查询",@"库存流水",@"采购进货",@"采购退货",@"库存盘点"];
    self.imgArray = @[@"chaxun",@"liushui",@"jinhuo",@"tuihuo",@"pandian"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stockArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kucun"];
    cell.nameLabel.text = self.stockArray[indexPath.row];
    cell.imageV.image = [UIImage imageNamed:@"rightArrow"];
    cell.pictureView.image = [UIImage imageNamed:self.imgArray[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        AllGoodsViewController *allGoodsVC = [[AllGoodsViewController alloc] init];
        [self.navigationController pushViewController:allGoodsVC animated:YES];
    }
    if (indexPath.row == 1) {
        WaterViewController *waterVC = [[WaterViewController alloc] init];
        [self.navigationController pushViewController:waterVC animated:YES];
    }
    if (indexPath.row == 2) {
        IntoWarehouseViewController *intoWarehouseVC = [[IntoWarehouseViewController alloc] init];
        [self.navigationController pushViewController:intoWarehouseVC animated:YES];
    }
    if (indexPath.row == 3) {
        TuiHuoViewController *tuihuoVC = [[TuiHuoViewController alloc] init];
        [self.navigationController pushViewController:tuihuoVC animated:YES];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
