//
//  GetMoneyTableViewCell.h
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/5/4.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SellModel.h"
@interface GetMoneyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *wareNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLBEL;
@property (nonatomic, strong) SellModel *sellModel;
@end
