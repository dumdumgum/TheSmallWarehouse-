//
//  AllGoodsTableViewCell.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/8.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "AllGoodsTableViewCell.h"
#import "YLLHeader.h"
@implementation AllGoodsTableViewCell

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
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 85, 105)];//130
        self.imgView.backgroundColor = kColorTwo;
        self.imgView.image = [UIImage imageNamed:@"img"];
        [self addSubview:self.imgView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 200, 30)];
        [self addSubview:self.nameLabel];
        self.IDLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 45, 200, 30)];
        [self addSubview:self.IDLabel];
        self.numLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 80, 150, 30)];
        [self addSubview:self.numLabel];
        self.princeLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 80, 100, 30)];
        [self addSubview:self.princeLabel];
    }
    return self;
}
- (void)setGoodsModel:(GoodsModel *)goodsModel {
    if (_goodsModel != goodsModel) {
        _goodsModel = goodsModel;
        self.nameLabel.text = goodsModel.name;
        self.IDLabel.text = [NSString stringWithFormat:@"货号：%@",goodsModel.goodID];
        self.numLabel.text = [NSString stringWithFormat:@"数量：%@",goodsModel.goodsNum];
        self.princeLabel.text = [NSString stringWithFormat:@"￥%@",goodsModel.sellPrice];
    }
}
@end
