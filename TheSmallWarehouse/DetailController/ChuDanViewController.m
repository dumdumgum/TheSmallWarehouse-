//
//  ChuDanViewController.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/23.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "ChuDanViewController.h"
#import "OneTableViewCell.h"
#import "WillChudanTableViewController.h"
#import "GetMoneyDataBase.h"
@interface ChuDanViewController ()<WillChudanTableViewControllerDelagate>
@property (nonatomic, copy) NSArray *a1;
@property (nonatomic, copy) NSArray *a2;
@property (nonatomic, copy) NSArray *a3;
@property (nonatomic, copy) NSArray *a4;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *b1;
@property (nonatomic, strong) UIButton *b2;

@property (nonatomic, strong) UILabel *beizhuLabel;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *hejiLabel;
@property (nonatomic, strong) UILabel *qianLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *colorLabel;
@property (nonatomic, strong) UILabel *sizeLabel;
@property (nonatomic, strong) UILabel *priceLebel;

@property (nonatomic, copy) NSString *text1;
@property (nonatomic, copy) NSString *text2;
@property (nonatomic, copy) NSString *text3;

@end

@implementation ChuDanViewController
- (NSArray *)a1 {
    if (!_a1) {
        _a1 = [[NSArray alloc] init];
    }
    return _a1;
}
- (NSArray *)a2 {
    if (!_a2) {
        _a2 = [[NSArray alloc] init];
    }
    return _a2;
}
- (NSArray *)a3 {
    if (!_a3) {
        _a3 = [[NSArray alloc] init];
    }
    return _a3;
}
- (NSArray *)a4 {
    if (!_a4) {
        _a4 = [[NSArray alloc] init];
    }
    return _a4;
}

- (instancetype)init {
    return [super initWithStyle:(UITableViewStyleGrouped)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.a1 = @[@"客户"];
    self.a2 = @[@"客户"];
    self.a3 = @[@"实收金额",@"业务日期"];
    self.a4 = @[@"00.00",@"2016-01-01" ];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"出售" style:(UIBarButtonItemStyleDone) target:self action:@selector(sell)];
    self.navigationItem.rightBarButtonItem = rightButton;
}
- (void)sell {
    SellModel *sellModel = [SellModel new];
    sellModel.kehu = _text1;
    sellModel.name = _nameLabel.text;
    sellModel.color = _colorLabel.text;
    sellModel.size = _sizeLabel.text;
    sellModel.price = _priceLebel.text;
    sellModel.money = _text2;
    sellModel.date = _text3;
    [[GetMoneyDataBase shareGetMoneyDataBase] insertRowToTableWithModel:sellModel];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma ------tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if(section == 1){
        return 2;
    }else if (section == 2) {
        return 2;
    }else {
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    OneTableViewCell *oneCell = [[OneTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"chudanOne"];
    [oneCell setTextChangedBlock:^(NSString *labelText, NSString *textFiledText) {
        NSLog(@"%@=========%@",labelText,textFiledText);
        if ([labelText isEqualToString:@"客户"]) {
            self.text1 = textFiledText;
        } else if([labelText isEqualToString:@"实收金额"]){
            self.text2 = textFiledText;
        }else if ([labelText isEqualToString:@"业务日期"]){
            self.text3 = textFiledText;
        }
    }];
    if (indexPath.section == 0) {
        oneCell.lable.text = self.a1[indexPath.row];
        oneCell.textFiled.placeholder = self.a2[indexPath.row];
        return oneCell;
    } else if(indexPath.section == 1){
        UITableViewCell *twoCell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"chudanTwo"];
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
            self.label.text = @"选择商品";
            [twoCell addSubview:self.label];
            self.b1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
            self.b1.frame = CGRectMake(100, 0, 30, 30);
            [self.b1 setImage:[UIImage imageNamed:@"saomiao副本"] forState:normal];
            [self.b1 addTarget:self action:@selector(addGoods) forControlEvents:(UIControlEventTouchUpInside)];
            [twoCell addSubview:self.b1];
            
            self.b2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
            self.b2.frame = CGRectMake(160, 0, 30, 30);
            [self.b2 setImage:[UIImage imageNamed:@"main04"] forState:normal];
            [self.b2 addTarget:self action:@selector(chooseGoods) forControlEvents:(UIControlEventTouchUpInside)];
            [twoCell addSubview:self.b2];
        }else {
            _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 88, 30)];
            _colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(98, 0, 88, 30)];
            _sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(186, 0, 88, 30)];
            _priceLebel = [[UILabel alloc] initWithFrame:CGRectMake(274, 0, 88, 30)];
            _priceLebel.backgroundColor = [UIColor greenColor];
            [twoCell addSubview:_nameLabel];
            [twoCell addSubview:_colorLabel];
            [twoCell addSubview:_sizeLabel];
            [twoCell addSubview:_priceLebel];
        }
        return twoCell;
    }else if (indexPath.section == 2) {
        oneCell.lable.text = self.a3[indexPath.row];
        oneCell.textFiled.placeholder = self.a4[indexPath.row];
        return oneCell;
    }else {
        
        UITableViewCell *fourCell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"chudanFour"];
        fourCell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            self.beizhuLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
            self.beizhuLabel.text = @"备注";
            self.beizhuLabel.font = [UIFont systemFontOfSize:14];
            self.textView = [[UITextView alloc] initWithFrame:CGRectMake(60, 0, 200, 66)];
            [fourCell addSubview:self.beizhuLabel];
            [fourCell addSubview:self.textView];
            return fourCell;
        }else{
            self.hejiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 70, 30)];
            self.hejiLabel.font = [UIFont systemFontOfSize:14];
            self.hejiLabel.text = @"合计： ￥";
            self.qianLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 10, 300, 30)];
            self.qianLabel.text = @"00.00";
            
            [fourCell addSubview:self.hejiLabel];
            [fourCell addSubview:self.qianLabel];
        }
        return fourCell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            return 66.0;
        }
    }
    return  44.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
- (void)addGoods {
    NSLog(@"ddddddddddd");
}
- (void)chooseGoods {
    WillChudanTableViewController *willChudanTVC = [[WillChudanTableViewController alloc] init];
    willChudanTVC.delagate = self;
    [self.navigationController pushViewController:willChudanTVC animated:YES];
}

#pragma --------代理传值方法
- (void)sendName:(NSString *)name color:(NSString *)color size:(NSString *)size price:(NSString *)price {
    _nameLabel.text = name;
    _colorLabel.text = color;
    _sizeLabel.text = size;
    _priceLebel.text = price;
}

@end
