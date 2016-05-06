//
//  AllGoodsTopView.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/8.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "AllGoodsTopView.h"
#define width self.frame.size.width
#define height self.frame.size.height
@implementation AllGoodsTopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *array = [NSArray array];
        array = @[@"仓库数",@"库存数量",@"库存金额",@"库存预警"];
        NSArray *array1 = [NSArray array];
        array1 = @[@"默认",@"名称",@"货号",@"库存量"];
        for (int i = 0; i < 4; i ++) {
            self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(i * (width / 4.0), 0, width / 4.0, 40)];
            self.label1.text = array[i];
            self.label1.textAlignment = NSTextAlignmentCenter;
            self.label1.font = [UIFont systemFontOfSize:14];
            [self addSubview:self.label1];
            
            self.button = [UIButton buttonWithType:(UIButtonTypeSystem)];
            [self.button setTitle:array1[i] forState:(UIControlStateNormal)];
            self.button.frame = CGRectMake(i * (width / 4.0), height * 0.7, width / 4.0, 30);
            [self addSubview:self.button];
        }
        self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, height * 0.68, width, height * 0.02)];
        self.label3.backgroundColor = [UIColor grayColor];
        [self addSubview:self.label3];
    }
    return self;
}

@end
