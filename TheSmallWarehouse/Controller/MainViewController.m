//
//  MainViewController.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/2/26.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "YLLHeader.h"
#import "PurchaseTableViewController.h"
#import "MainCollectionViewCell.h"
#import "AllGoodsViewController.h"
#import "SellDanViewController.h"
#import "JingYingViewController.h"

@interface MainViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) MainView *mainView;
@property (nonatomic,strong) NSArray *titleArray;
@end

@implementation MainViewController
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [[NSArray alloc] init];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    self.titleArray = @[@"采购单",@"销售单",@"库存查询",@"经营概况",@"添加"];
    UICollectionViewFlowLayout *floLayout = [[UICollectionViewFlowLayout alloc] init];
    floLayout.itemSize = CGSizeMake(kWidth / 3.0, kWidth / 3.0);
    floLayout.minimumLineSpacing = 0;
    floLayout.minimumInteritemSpacing = 0;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:floLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    [self.view addSubview:collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titleArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.titleLabel.text = self.titleArray[indexPath.item];
    cell.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"main0%ld",indexPath.item]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.item) {
        case 0:
        {
            PurchaseTableViewController *puechaseTVC = [[PurchaseTableViewController alloc] init];
            [self.navigationController pushViewController:puechaseTVC animated:YES];
        }
            break;
        case 1:
        {
            SellDanViewController *sellDanVC = [[SellDanViewController alloc] init];
            [self.navigationController pushViewController:sellDanVC animated:YES];
        }
            break;
        case 2:
        {
            AllGoodsViewController *allgoodsVC = [[AllGoodsViewController alloc] init];
            [self.navigationController pushViewController:allgoodsVC animated:YES];
        }
            break;
        case 3:
        {
            JingYingViewController *jingyingVC = [[JingYingViewController alloc] init];
            [self.navigationController pushViewController:jingyingVC animated:YES];
        }
            break;
        case 4:
            
            break;
            
        default:
            break;
    }
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
