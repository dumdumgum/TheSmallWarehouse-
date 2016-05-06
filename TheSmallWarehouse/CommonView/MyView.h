//
//  MyView.h
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/16.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UILabel *smallLabel;
@property(nonatomic, strong)UILabel *numLabel;

- (instancetype)initWithFrame:(CGRect)frame titleLabel:(NSString *)title target:(id)target action:(SEL)action;
@end
