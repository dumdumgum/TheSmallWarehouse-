//
//  TopButtonView.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/16.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "TopButtonView.h"
#import "YLLHeader.h"
@implementation TopButtonView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.b1 = [[MyButton alloc] initWithFrame:kFrameBOne corners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(20, 20)];
        [self.b1 setTitle:@"今日" forState:(UIControlStateNormal)];
        [self addSubview:self.b1];
        
        self.b2 = [[MyButton alloc] initWithFrame:kFrameBTwo corners:UIRectCornerTopLeft cornerRadii:CGSizeMake(0, 0)];
        [self.b2 setTitle:@"昨日" forState:(UIControlStateNormal)];
        [self addSubview:self.b2];
        
        self.b3 = [[MyButton alloc] initWithFrame:kFrameBThree corners:UIRectCornerTopLeft cornerRadii:CGSizeMake(0, 0)];
        [self.b3 setTitle:@"近7天" forState:(UIControlStateNormal)];
        [self addSubview:self.b3];
        
        self.b4 = [[MyButton alloc] initWithFrame:kFrameBFour corners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
        [self.b4 setTitle:@"近30天" forState:(UIControlStateNormal)];
        [self addSubview:self.b4];
    }
    return self;
}


@end
