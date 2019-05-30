//
//  BroadCast.m
//  通知中心
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "BroadCast.h"
static BroadCast *br = nil;
@implementation BroadCast
+(BroadCast *)shareBroadcast{
    if (br == nil) {
        br=[[[self class]alloc]init];
    }
    return br;
}
-(void)sendmessage{
    //取得当前系统的一个通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    //发送广播
    NSDictionary *pram = @{@"userId":@"123",@"userName":@"jack"};
    [center postNotificationName:@"mmff120" object:self userInfo:pram];
}
//重复发送
-(void)repeatSendMessage{
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(sendmessage) userInfo:nil repeats:YES];
}
@end
