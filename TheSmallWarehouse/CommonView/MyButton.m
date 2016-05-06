//
//  MyButton.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/7.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton
/*
 UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:b.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerTopLeft cornerRadii:CGSizeMake(20,20)];
 
 CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
 
 maskLayer.frame = b.bounds;
 
 maskLayer.path = maskPath.CGPath;
 
 b.layer.mask = maskLayer;

 */
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerTopLeft cornerRadii:CGSizeMake(20,20)];
//        
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        
//        maskLayer.frame = self.bounds;
//        
//        maskLayer.path = maskPath.CGPath;
//        
//        self.layer.mask = maskLayer;
//
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame corners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii {
    self = [super initWithFrame:frame];
    if (self) {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        
        maskLayer.frame = self.bounds;
        
        maskLayer.path = maskPath.CGPath;
        
        self.layer.mask = maskLayer;
        
        self.backgroundColor = [UIColor whiteColor];
        [self setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

@end
