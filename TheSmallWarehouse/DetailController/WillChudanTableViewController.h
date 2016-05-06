//
//  WillChudanTableViewController.h
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/23.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WillChudanTableViewControllerDelagate <NSObject>

- (void)sendName:(NSString *)name color:(NSString *)color size:(NSString *)size price:(NSString *)price;

@end
@interface WillChudanTableViewController : UITableViewController
@property (nonatomic, weak) id<WillChudanTableViewControllerDelagate>delagate;
@end
