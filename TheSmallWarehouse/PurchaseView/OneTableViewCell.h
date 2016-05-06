//
//  OneTableViewCell.h
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/4.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GoodsModel;

@interface OneTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *lable;
@property (nonatomic, strong) UITextField *textFiled;
@property (nonatomic,weak) GoodsModel *goodModel;

@property (nonatomic,copy) void(^textChangedBlock)(NSString *,NSString *);

@end
