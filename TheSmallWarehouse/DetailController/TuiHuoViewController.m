//
//  TuiHuoViewController.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/18.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "TuiHuoViewController.h"
#import "YLLHeader.h"
#import "MyButton.h"
#import "PurchaseTableViewController.h"
#import "WillTuihuoViewController.h"
@interface TuiHuoViewController ()
@property (nonatomic, strong) MyButton *b1;
@property (nonatomic, strong) MyButton *b2;
@property (nonatomic, strong) MyButton *b3;
@property (nonatomic, strong) MyButton *b4;
@end

@implementation TuiHuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    [self showTopView];
    
    UIBarButtonItem *rightBI = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(tapGR)];
    self.navigationItem.rightBarButtonItem = rightBI;
    
    
    self.b1 = [[MyButton alloc] initWithFrame:kFrameBOne corners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(20, 20)];
    [self.b1 setTitle:@"默认" forState:(UIControlStateNormal)];
    [self.b1 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b1];
    
    self.b2 = [[MyButton alloc] initWithFrame:kFrameBTwo corners:UIRectCornerTopLeft cornerRadii:CGSizeMake(0, 0)];
    [self.b2 setTitle:@"已退货" forState:(UIControlStateNormal)];
    [self.b2 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b2];
    
    self.b3 = [[MyButton alloc] initWithFrame:kFrameBThree corners:UIRectCornerTopLeft cornerRadii:CGSizeMake(0, 0)];
    [self.b3 setTitle:@"草稿" forState:(UIControlStateNormal)];
    [self.b3 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b3];
    
    self.b4 = [[MyButton alloc] initWithFrame:kFrameBFour corners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    [self.b4 setTitle:@"撤销" forState:(UIControlStateNormal)];
    [self.b4 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b4];
    

    // Do any additional setup after loading the view.
}
- (void)showTopView {
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight * 0.06)];
    self.topView.backgroundColor = kColorThree;
    [self.view addSubview:self.topView];
}

- (void)myButtonAction {
    NSLog(@"mymymyjy");
}

- (void)tapGR {
    WillTuihuoViewController *willTuihuoVC = [[WillTuihuoViewController alloc] init];
    [self.navigationController pushViewController:willTuihuoVC animated:YES];
//    PurchaseTableViewController *puechaseTVC = [[PurchaseTableViewController alloc] init];
//    [self.navigationController pushViewController:puechaseTVC animated:YES];
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
