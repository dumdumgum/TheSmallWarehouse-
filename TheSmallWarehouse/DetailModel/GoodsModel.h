//
//  GoodsModel.h
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/3/6.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *price;//采购价
@property (nonatomic,copy) NSString *priceTwo;//批发价
@property (nonatomic,copy) NSString *sellPrice;//零售价
@property (nonatomic,copy) NSString *goodID;//货号
@property (nonatomic,copy) NSString *goodsColor;
@property (nonatomic,copy) NSString *goodsSize;
@property (nonatomic,copy) NSString *goodsNum;//货物数量
@property (nonatomic,copy) NSData *imageData;
@property (nonatomic,copy) NSString *gongYingShang;//供应商
@property (nonatomic,copy) NSString *warehouse;
@property (nonatomic,copy) NSString *fukuan;//付款
@property (nonatomic,copy) NSString *date;//日期
@end
