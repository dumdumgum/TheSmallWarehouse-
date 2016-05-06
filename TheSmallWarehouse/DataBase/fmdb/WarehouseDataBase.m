//
//  WarehouseDataBase.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/3/6.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "WarehouseDataBase.h"
static WarehouseDataBase *db;
@implementation WarehouseDataBase
+ (WarehouseDataBase *)shareWarehouseDataBase {
    static dispatch_once_t onceToken;
    if (db == nil) {
        dispatch_once(&onceToken,^{
            db = [[WarehouseDataBase alloc] init];
        });
    }
    return db;
}

- (NSString *)createPathForSqliteWithSqliteName:(NSString *)sqliteName {
    NSString *dataPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:sqliteName];
    return dataPath;
}
- (void)openDataBaseWithSqliteName:(NSString *)sqliteName {
    NSString *dataPath = [self createPathForSqliteWithSqliteName:sqliteName];
    NSLog(@"%@",dataPath);
    self.dataBase = [FMDatabase databaseWithPath:dataPath];
}
- (void)closeSqlite {
    [self.dataBase close];
}
- (void)createTabeleForSqliteWithName:(NSString *)sqliteName {
    if (!_dataBase) {
        [self openDataBaseWithSqliteName:[NSString stringWithFormat:@"%@.db",sqliteName]];
    }
    NSString *createTableString = [NSString stringWithFormat:@"CREATE TABLE GoodsDataBase (GoodID TEXT,Name TEXT, Price TEXT,PriceTwo TEXT,SellPrice TEXT,GoodsColor TEXT,GoodsSize TEXT,GoodsNum TEXT,imgData blob,Gongyingshang TEXT,Warehouse TEXT,Fukuan TEXT,Date TEXT)"];
    if ([_dataBase open]) {
        BOOL dataName = [_dataBase executeUpdate:createTableString];
        if (dataName) {
            NSLog(@"创建成功");
        }else {
            NSLog(@"创建失败");
        }
    }
}

- (void)insertRowToTableWithModel:(GoodsModel *)goodsModel {
    if (!goodsModel) {
        NSLog(@"weikong");
    }else if ([self.dataBase open]) {//, imgData,Gongyingshang,Warehouse,Fukuan,Date ----  ,goodsModel.imageData,goodsModel.gongYingShang,goodsModel.warehouse,goodsModel.fukuan,goodsModel.date
        NSString *insertString = [NSString stringWithFormat:@"insert into GoodsDataBase (GoodID, Name, Price, PriceTwo, SellPrice, GoodsColor, GoodsSize, GoodsNum,Gongyingshang,Warehouse,Fukuan,Date)values(?,?,?,?,?,?,?,?,?,?,?,?)"];
        BOOL insertSqliteResult = [_dataBase executeUpdate:insertString,goodsModel.goodID,goodsModel.name,goodsModel.price,goodsModel.priceTwo,goodsModel.sellPrice,goodsModel.goodsColor,goodsModel.goodsSize,goodsModel.goodsNum,goodsModel.gongYingShang,goodsModel.warehouse,goodsModel.fukuan,goodsModel.date];
        if (insertSqliteResult) {
            NSLog(@"插入成功");
        }
    }
    
}
- (NSArray *)selectAllDataWithTable {
    NSMutableArray *dataArray = [NSMutableArray array];
    if ([_dataBase open]) {
        NSString *selectAll = [NSString stringWithFormat:@"select *from GoodsDataBase"];
        FMResultSet *selectSet = [self.dataBase executeQuery:selectAll];
        while ([selectSet next]) {
            NSString *goodID = [selectSet stringForColumn:@"GoodID"];
            NSString *name = [selectSet stringForColumn:@"Name"];
            NSString *price = [selectSet stringForColumn:@"Price"];
            NSString *priceTwo = [selectSet stringForColumn:@"PriceTwo"];
            NSString *sellPrice = [selectSet stringForColumn:@"SellPrice"];
            NSString *goodsColor = [selectSet stringForColumn:@"GoodsColor"];
            NSString *goodsSize = [selectSet stringForColumn:@"GoodsSize"];
            NSString *goodsNum = [selectSet stringForColumn:@"GoodsNum"];
            NSData *imgData = [selectSet dataForColumn:@"imgData"];
            NSString *gongYingShang = [selectSet stringForColumn:@"Gongyingshang"];
            NSString *warehouse = [selectSet stringForColumn:@"Warehouse"];
            NSString *fukuan = [selectSet stringForColumn:@"Fukuan"];
            NSString *date = [selectSet stringForColumn:@"Date"];

            GoodsModel *model = [[GoodsModel alloc] init];
            model.goodID = goodID;
            model.name = name;
            model.price = price;
            model.priceTwo = priceTwo;
            model.sellPrice = sellPrice;
            model.goodsColor = goodsColor;
            model.goodsSize = goodsSize;
            model.goodsNum = goodsNum;
            model.imageData = imgData;
            model.gongYingShang = gongYingShang;
            model.warehouse = warehouse;
            model.fukuan = fukuan;
            model.date = date;
            [dataArray addObject:model];
        }
    }
    return [dataArray copy];
}
@end
