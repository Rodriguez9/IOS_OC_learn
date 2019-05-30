//
//  main.m
//  文件管理
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     NSFileHandle *hf=[NSFileHandle fileHandleForReadingAtPath:[NSString stringWithFormat:@"%@/hello",PATH]]
    }
    return 0;
}
