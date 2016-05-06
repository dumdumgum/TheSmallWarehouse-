//
//  CommonTableViewCell.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/2/27.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//
#import "CommonTableViewCell.h"
#import "YLLHeader.h"
@implementation CommonTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        self.pictureView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 38, 38)];
        self.pictureView.image = [UIImage imageNamed:@"zhanwei"];
        [self addSubview:self.pictureView];
        //
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 100, 40)];
        [self addSubview:self.nameLabel];
        //
        self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth - 30, 20, 15, 20)];
        [self addSubview:self.imageV];
        
    }
    return self;
}
@end
