//
//  BroadCast.h
//  通知中心
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BroadCast : NSObject
+(BroadCast *)shareBroadcast;
-(void)sendmessage;
-(void)repeatSendMessage;
@end
