//
//  AllGoodsTableViewCell.h
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/8.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@interface AllGoodsTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *IDLabel;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UILabel *princeLabel;
@property (nonatomic, strong) GoodsModel *goodsModel;
@end
