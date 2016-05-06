//
//  GetMoneyDataBase.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/5/5.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "GetMoneyDataBase.h"
static GetMoneyDataBase *db;

@implementation GetMoneyDataBase
+ (GetMoneyDataBase *)shareGetMoneyDataBase {
    static dispatch_once_t onceToken;
    if (db == nil) {
        dispatch_once(&onceToken,^{
            db = [[GetMoneyDataBase alloc] init];
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
    NSString *createTableString = [NSString stringWithFormat:@"CREATE TABLE GetMoneyDataBase (Kehu TEXT,Name TEXT, Color TEXT,Size TEXT, Price TEXT,Money TEXT,Date TEXT,Beizhu TEXT,Heji TEXT)"];
    if ([_dataBase open]) {
        BOOL dataName = [_dataBase executeUpdate:createTableString];
        if (dataName) {
            NSLog(@"创建成功");
        }else {
            NSLog(@"创建失败");
        }
    }
}
- (void)insertRowToTableWithModel:(SellModel *)sellModel {
    if (!sellModel) {
        NSLog(@"weikong");
    }else if ([self.dataBase open]) {
        NSString *insertString = [NSString stringWithFormat:@"insert into GetMoneyDataBase (Kehu,Name,Color,Size,Price,Money,Date,Beizhu,Heji)values(?,?,?,?,?,?,?,?,?)"];
        BOOL insertSqliteResult = [_dataBase executeUpdate:insertString,sellModel.kehu,sellModel.name,sellModel.color,sellModel.size,sellModel.price,sellModel.money,sellModel.date,sellModel.beizhu,sellModel.heji];
        if (insertSqliteResult) {
            NSLog(@"插入成功");
        }
    }
    
}
- (NSArray *)selectAllDataWithTable {
    NSMutableArray *dataArray = [NSMutableArray array];
    if ([_dataBase open]) {
        NSString *selectAll = [NSString stringWithFormat:@"select *from GetMoneyDataBase"];
        FMResultSet *selectSet = [self.dataBase executeQuery:selectAll];
        while ([selectSet next]) {
            NSString *kehu = [selectSet stringForColumn:@"Kehu"];
            NSString *name = [selectSet stringForColumn:@"Name"];
            NSString *color = [selectSet stringForColumn:@"Color"];
            NSString *size = [selectSet stringForColumn:@"Size"];
            NSString *price = [selectSet stringForColumn:@"Price"];
            NSString *money = [selectSet stringForColumn:@"Money"];
            NSString *date = [selectSet stringForColumn:@"Date"];
            NSString *beizhu = [selectSet stringForColumn:@"Beizhu"];
            NSString *heji = [selectSet stringForColumn:@"Heji"];

            SellModel *model = [[SellModel alloc] init];
            model.kehu = kehu;
            model.name = name;
            model.price = price;
            model.color = color;
            model.size = size;
            model.money = money;
            model.date = date;
            model.beizhu = beizhu;
            model.heji = heji;
           
            [dataArray addObject:model];
        }
    }
    return [dataArray copy];
}
@end
