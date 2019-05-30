//
//  Student.h
//  编码对象
//
//  Created by YZH on 2018/2/14.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Student : NSObject<NSCoding>{
    NSString *sno;
    NSString *name;
    NSInteger score;
}
@property(nonatomic,strong)NSString *sno;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSNumber* score;
-(id)init:(NSString *)sno name:(NSString *)name score:(NSNumber*)score;

@end
