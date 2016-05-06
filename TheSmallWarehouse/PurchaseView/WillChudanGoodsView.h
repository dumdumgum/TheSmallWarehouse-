//
//  WillChudanGoodsView.h
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/23.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WillChudanGoodsView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITextField *goodsCount;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@end
