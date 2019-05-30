//
//  HumanA.h
//  blocks
//
//  Created by YZH on 2018/1/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^degreeCB) (NSString *str);
@interface HumanA : NSObject
@property(nonatomic,copy)NSString *degree;
@property(nonatomic,copy)degreeCB dCB;
@end
