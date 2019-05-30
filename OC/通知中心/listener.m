//
//  listener.m
//  通知中心
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "listener.h"

@implementation listener
-(void)resaveBroadCast{
    //注册广播中心
    [[NSNotificationCenter defaultCenter ]addObserver:self selector:@selector(happy:) name:@"mmff120" object:nil];
}
//收到广播后执行
-(void) happy:(NSNotification *)notice{
    NSLog(@"%@",notice.userInfo);
}
@end
