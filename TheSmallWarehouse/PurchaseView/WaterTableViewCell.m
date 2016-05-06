//
//  WaterTableViewCell.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/11.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "WaterTableViewCell.h"
#import "YLLHeader.h"
@implementation WaterTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.lable1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
        [self addSubview:self.lable1];
        
        self.lable2 = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, kWidth-130, 30)];
        self.lable2.backgroundColor = kColorTwo;
        self.lable2.userInteractionEnabled = YES;
        [self addSubview:self.lable2];
        
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth - 20, 30, 10, 10)];
        self.imgView.image = [UIImage imageNamed:@"xiajiaobiao"];
        [self addSubview:self.imgView];
    }
    return self;
}
@end
