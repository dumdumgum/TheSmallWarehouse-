//
//  MyView.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/16.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame titleLabel:(NSString *)title target:(id)target action:(SEL)action{
    self = [super initWithFrame: frame];
    if (self) {
        self.userInteractionEnabled = YES;
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, width-20, height/2.0)];
        self.smallLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, height/2.0, 10, height/2.0)];
        self.numLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, height/2.0, width-30, height/2.0)];
        
        self.titleLabel.text = title;
        self.smallLabel.text = @"￥";
        self.numLabel.text = @"0.00";
        [self addSubview:self.titleLabel];
        [self addSubview:self.smallLabel];
        [self addSubview:self.numLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

@end
