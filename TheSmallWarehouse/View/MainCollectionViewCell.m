//
//  MainCollectionViewCell.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/7.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "MainCollectionViewCell.h"

@implementation MainCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = self.frame.size.width;
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(45, 25, width - 90, width - 90)];
        [self addSubview:self.imgView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, width-53, width, 30)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.titleLabel];
    }
    return self;
}

@end
