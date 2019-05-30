//
//  main.m
//  通知中心
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BroadCast.h"
#import "listener.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        listener *ls = [[listener alloc]init];
        [ls resaveBroadCast];
        BroadCast *br =[BroadCast shareBroadcast];
        [br sendmessage];
    }
    return 0;
}
