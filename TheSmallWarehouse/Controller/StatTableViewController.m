//
//  StatTableViewController.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/2/27.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "StatTableViewController.h"
#import "CommonTableViewCell.h"
#import "BuyViewController.h"
#import "SellViewController.h"
#import "DuiBiViewController.h"
#import "PanDianViewController.h"
#import "JingYingViewController.h"
@interface StatTableViewController ()
@property (nonatomic,retain) NSArray *statArray;
@property (nonatomic,strong) JingYingViewController *jingyingVC;
@end

@implementation StatTableViewController

- (NSArray *)stockArray {
    if (!_statArray) {
        _statArray = [[NSArray alloc] init];
    }
    return _statArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"统计";
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[CommonTableViewCell class] forCellReuseIdentifier:@"tongji"];
    self.tableView.rowHeight = 60;
    self.statArray = @[@"经营概况",@"采购报表",@"销售报表",@"进销对比",@"盘点报表"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tongji"];
    
    cell.nameLabel.text = self.statArray[indexPath.row];
    cell.imageV.image = [UIImage imageNamed:@"rightArrow"];
    cell.pictureView.image = [UIImage imageNamed:@"baobiao"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            self.jingyingVC = [[JingYingViewController alloc] init];
            [self.navigationController pushViewController:self.jingyingVC animated:YES];
        }
            break;
        case 1:
        {
            BuyViewController *buyVC = [[BuyViewController alloc] init];
            [self.navigationController pushViewController:buyVC animated:YES];
        }
            break;
        case 2:
        {
            SellViewController *sellVC = [[SellViewController alloc] init];
            [self.navigationController pushViewController:sellVC animated:YES];
        }
            break;
        case 3:
        {
            DuiBiViewController *duibiVC = [[DuiBiViewController alloc] init];
            [self.navigationController pushViewController:duibiVC animated:YES];
        }
            break;
        case 4:
        {
            PanDianViewController *pandianVC = [[PanDianViewController alloc] init];
            [self.navigationController pushViewController:pandianVC animated:YES];
        }
            break;
        default:
            break;
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
