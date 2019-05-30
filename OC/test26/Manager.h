//
//  Manager.h
//  test26
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject
{
    NSString *_title;
}
@property(strong) NSString *title;
+(id) shardeManager;
@end
