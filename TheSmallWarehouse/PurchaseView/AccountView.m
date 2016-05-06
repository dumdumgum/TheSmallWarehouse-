//
//  AccountView.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/16.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "AccountView.h"

@implementation AccountView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        self.shouruLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width/3.0, height/2.0)];
        self.shouruNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, height/2.0, width/3.0, height/2.0)];
        self.zhichuLabel = [[UILabel alloc] initWithFrame:CGRectMake(width/3.0, 0, width/3.0, height/2.0)];
        self.zhichuNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(width/3.0, height/2.0, width/3.0, height/2.0)];
        self.hejiLabel = [[UILabel alloc] initWithFrame:CGRectMake(width/3.0*2, 0, width/3.0, height/2.0)];
        self.hejiNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(width/3.0*2, height/2.0, width/3.0, height/2.0)];
        self.shouruLabel.text = @"收入:";
        self.shouruNumLabel.text = @"0.00";
        self.zhichuLabel.text = @"支出:";
        self.zhichuNumLabel.text = @"0.00";
        self.hejiLabel.text = @"合计:";
        self.hejiNumLabel.text = @"0.00";
        self.shouruLabel.textAlignment = NSTextAlignmentCenter;
        self.shouruNumLabel.textAlignment = NSTextAlignmentCenter;
        self.zhichuLabel.textAlignment = NSTextAlignmentCenter;
        self.zhichuNumLabel.textAlignment = NSTextAlignmentCenter;
        self.hejiLabel.textAlignment = NSTextAlignmentCenter;
        self.hejiNumLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:self.shouruLabel];
        [self addSubview:self.shouruNumLabel];
        [self addSubview:self.zhichuLabel];
        [self addSubview:self.zhichuNumLabel];
        [self addSubview:self.hejiLabel];
        [self addSubview:self.hejiNumLabel];
    }
    return self;
}

@end
