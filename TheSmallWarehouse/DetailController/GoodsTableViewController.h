//
//  GoodsTableViewController.h
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/7.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"

@interface GoodsTableViewController : UITableViewController
@property (nonatomic, strong) GoodsModel *goodsModel;
@property (nonatomic, copy) NSString *textFiledText;
@property (nonatomic, copy) NSString *textFiledText1;
@property (nonatomic, copy) NSString *textFiledText2;
@property (nonatomic, copy) NSString *textFiledText3;
@end
