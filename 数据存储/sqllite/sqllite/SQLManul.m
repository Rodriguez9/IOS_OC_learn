//
//  SQLManul.m
//  sqllite
//
//  Created by YZH on 2018/2/9.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "SQLManul.h"
#import "sqlite3.h"

@implementation SQLManul

#define KNameFile (@"/Student.sqlite")

static SQLManul *manager=nil;

+(SQLManul *)shareManager{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager =[[self alloc]init];
        [manager createDataBaseTableIfNeeded];
    });
    return manager;
}

-(NSString *)applicationDocumentsDirectoryFile{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory =[path firstObject];
    NSString *filePath = [documentDirectory stringByAppendingString:KNameFile];
    return filePath;
}

-(void)createDataBaseTableIfNeeded{
    NSString *write =[self applicationDocumentsDirectoryFile];
    NSLog(@"数据库地址为%@",write);
   //第一个参数是数据库文件的完整路径，第二个为数据库对象，SQLITE_OK数据库打开成功
    if ( sqlite3_open([write UTF8String], &db)!=SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(NO, @"数据库打开失败");
    }else{
        char *err;
        NSString *createSQL =[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS StduentName (idNum TEXT PRIMARY KEY,name TEXT);"];
        //参数：db对象，执行语句,回调函数，回调函数传递的参数，错误信息
        if (sqlite3_exec(db, [createSQL UTF8String], nil, nil, &err)!=SQLITE_OK) {
            sqlite3_close(db);
            NSAssert(NO, @"数据表创建失败");
        }
       sqlite3_close(db);
    }
}
//查询
-(Student *)searchWithIdNum:(Student *)model{
    NSString *path = [self applicationDocumentsDirectoryFile];
    if(sqlite3_open([path UTF8String], &db)!=SQLITE_OK){
        sqlite3_close(db);
        NSAssert(NO, @"数据表查询失败");
    }
    else{
       // NSString *qsql = @"SELECT idNum,name FROM StduentName where idNum=?";
        NSString *qsql = @"SELECT * FROM StduentName";
        sqlite3_stmt *statement;//语句对象
        //sqlite3_prepare_v2预处理SQL语句
        //第一个参数 数据库对象，
        //第二个参数：SQL语句，
        //第三个：执行语句的长度，-1为全部，
        //第四个：语句对象。
        //第五个：没有执行的语句部分
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, nil)==SQLITE_OK) {
            //进行按主键查询数据库
            NSString *idNum = model.id;
            //sqlite3_bind_text:绑定
            //第一个参数 语句对象
            //第二个参数 参数开始执行的序号
            //第三个参数 要绑定的值
            //第四个参数 绑定的字符串的长度
            //第五个参数 指针NULL
           // sqlite3_bind_text(statement, 1, [idNum UTF8String], -1, NULL);
            //SQLITE_ROW查出来了
            //sqlite3_step()执行sql语句遍历结果集
            while(sqlite3_step(statement)==SQLITE_ROW) {
                //提取数据，
                //第一个参数：语句对象，
                //第二个参数：字段的索引
                char *idNum=(char *)sqlite3_column_text(statement, 0);
                //数据转换
                NSString *idNumStr = [[NSString alloc] initWithUTF8String:idNum];
                char *idName=(char *)sqlite3_column_text(statement, 1);
                NSString *idNameStr = [[NSString alloc] initWithUTF8String:idName];
                Student *model = [[Student alloc] init];
                model.id = idNumStr;
                model.name = idNameStr;
                sqlite3_finalize(statement);
                sqlite3_close(db);
                return model;
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return nil;
}

//加入
-(int)insert:(Student *)model{
    NSString *path = [self applicationDocumentsDirectoryFile];
    if(sqlite3_open([path UTF8String], &db)!=SQLITE_OK){
        sqlite3_close(db);
        NSAssert(NO, @"数据表打开失败");
    }
    else{
        NSString *sql = @"INSERT INTO StduentName (idNum,name) VALUES (?,?)";
        sqlite3_stmt *statement;
         if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK) {
             NSString *idNum = model.id;
             NSString *idName = model.name;
              sqlite3_bind_text(statement, 1, [idNum UTF8String], -1, NULL);
              sqlite3_bind_text(statement, 2, [idName UTF8String], -1, NULL);
             //SQLITE_DONE执行成功
             if (sqlite3_step(statement)!=SQLITE_DONE) {
                  NSAssert(NO, @"数据表添加失败");
             }
             sqlite3_finalize(statement);
             sqlite3_close(db);
         }
    }
    return 0;
}

@end
