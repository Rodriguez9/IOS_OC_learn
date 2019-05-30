//
//  HumanB.h
//  blocks
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HumanA.h"
@interface HumanB : NSObject
@property(nonatomic,strong)HumanA *ha;
-(void)giveDegree:(NSString *)degress;
@end
