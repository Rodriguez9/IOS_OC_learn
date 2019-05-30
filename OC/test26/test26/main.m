//
//  main.m
//  test26
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manager.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Manager *manger = [Manager shardeManager];
        NSLog(@"%@",manger.title) ;
    }
    return 0;
}
