//
//  Manager.m
//  test26
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "Manager.h"
static Manager *manger=nil;
@implementation Manager
@synthesize title=_title;
+(id) shardeManager{
    if (manger==nil) {
        manger=[[[self class]alloc]init];
    }
    return manger;
}
-(id) init{
    self =[super init];
    if (self) {
        self.title=@"default title";
    }
    return self;
}
@end
