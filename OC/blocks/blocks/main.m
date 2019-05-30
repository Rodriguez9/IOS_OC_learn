//
//  main.m
//  blocks
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HumanA.h"
#import "HumanB.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
      //block 取代代理，做一个回调
        HumanA *ha =[[HumanA alloc]init];
        ha.degree=@"XS";
        __block HumanA *temHa=ha;
        ha.dCB = ^(NSString *str){
            temHa.degree=str;
        };
        HumanB *hb =[[HumanB alloc]init];
        hb.ha=ha;
    }
    return 0;
}
