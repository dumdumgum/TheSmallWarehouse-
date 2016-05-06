//
//  GetMoneyDataBase.h
//  TheSmallWarehouse
//
//  Created by GumGum on 16/5/5.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "SellModel.h"
@interface GetMoneyDataBase : NSObject
@property (nonatomic,strong) FMDatabase *dataBase;
+ (GetMoneyDataBase *)shareGetMoneyDataBase;
//根据数据库名字 创建路径
- (NSString *)createPathForSqliteWithSqliteName:(NSString *)sqliteName;

//根据数据库名字打开数据库
- (void)openDataBaseWithSqliteName:(NSString *)sqliteName;

//关闭数据库
- (void)closeSqlite;

//根据给的表名 创建数据库表 如果没有就用给的 数据库名字创建一个数据库
- (void)createTabeleForSqliteWithName:(NSString *)sqliteName;

//插入一条数据
- (void)insertRowToTableWithModel:(SellModel *)sellModel;

//获取整个数据库
- (NSArray *)selectAllDataWithTable;
@end
