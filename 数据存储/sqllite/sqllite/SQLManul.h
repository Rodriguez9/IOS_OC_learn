//
//  SQLManul.h
//  sqllite
//
//  Created by YZH on 2018/2/9.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "Student.h"
@interface SQLManul : NSObject{
    sqlite3 *db;
}
//返回一个SQLManul单例
+(SQLManul *)shareManager;

//Document路径
-(NSString *)applicationDocumentsDirectoryFile;

//创建表如果需要
-(void)createDataBaseTableIfNeeded;

//查询
-(Student *)searchWithIdNum:(Student *)model;

-(int)insert:(Student *)model;
@end
