//
//  GoodsTableViewController.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/7.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "GoodsTableViewController.h"
#import "OneTableViewCell.h"
#import "WarehouseDataBase.h"
@interface GoodsTableViewController ()
@property (nonatomic, copy) NSArray *a1;
@property (nonatomic, copy) NSArray *a2;
@property (nonatomic, copy) NSArray *a3;
@property (nonatomic, copy) NSArray *a4;
@property (nonatomic, copy) NSArray *a5;
@property (nonatomic, copy) NSArray *a6;
@property (nonatomic, strong) OneTableViewCell *cell;
@end

@implementation GoodsTableViewController

- (instancetype)init {
    return [super initWithStyle:(UITableViewStyleGrouped)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    self.a1 = @[@"名称",@"货号"];
    self.a2 = @[@"商品名称",@"货号唯一，不可修改"];
    self.a3 = @[@"采购价(元)",@"批发价(元)",@"零售价(元)"];
    self.a4 = @[@"00.00",@"00.00",@"00.00"];
    self.a5 = @[@"颜色",@"尺码"];

    self.goodsModel = [GoodsModel new]; //初始化模型
    self.goodsModel.gongYingShang = _textFiledText;
    self.goodsModel.warehouse = _textFiledText1;
    self.goodsModel.fukuan = _textFiledText2;
    self.goodsModel.date = _textFiledText3;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:(UIBarButtonItemStyleDone) target:self action:@selector(done)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)done {
    [[WarehouseDataBase shareWarehouseDataBase] insertRowToTableWithModel:self.goodsModel];
}
- (UITextField *)textWithtag:(NSInteger)tag {
    
    UITextField *textField = (UITextField *)[self.cell viewWithTag:tag];
    
    return textField;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 3;
    }else if (section == 2) {
        return 2;
    }else {
        return 1;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OneTableViewCell *cell = [[OneTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"Cell"];
//    [cell setTextChangedBlock:^(NSString * labelText, NSString *textFieldText) {
//        NSLog(@"%@--%@",labelText,textFieldText);
//    }];
    //给cell赋模型
    cell.goodModel = self.goodsModel;
    
    if (indexPath.section == 0) {
        cell.lable.text = self.a1[indexPath.row];
        cell.textFiled.placeholder = self.a2[indexPath.row];
        return cell;
    }else if (indexPath.section == 1) {
        cell.lable.text = self.a3[indexPath.row];
        cell.textFiled.placeholder = self.a4[indexPath.row];
        cell.textFiled.keyboardType = UIKeyboardTypeNumberPad;
        return cell;
    }else if (indexPath.section == 2) {
        cell.lable.text = self.a5[indexPath.row];
        if (indexPath.row == 0) {
            cell.textFiled.placeholder = @"白色、黑色";
        }else {
            cell.textFiled.placeholder = @"S、M、26、27、";
        }
        return cell;
    }else {
        cell.lable.text = @"货物数量";
        cell.textFiled.placeholder = @"00000";
        cell.textFiled.keyboardType = UIKeyboardTypeNumberPad;
        return cell;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
