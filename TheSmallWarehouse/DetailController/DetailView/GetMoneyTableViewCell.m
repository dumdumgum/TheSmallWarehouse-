//
//  GetMoneyTableViewCell.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/5/4.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "GetMoneyTableViewCell.h"

@implementation GetMoneyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setSellModel:(SellModel *)sellModel {
    if (_sellModel != sellModel) {
        _sellModel = sellModel;
        _nameLabel.text = sellModel.name;
        _timeLabel.text = sellModel.date;
        _wareNameLabel.text = @"默认仓库";
        _moneyLBEL.text = sellModel.price;
    }
}
@end
