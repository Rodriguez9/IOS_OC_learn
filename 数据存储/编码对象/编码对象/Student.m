//
//  Student.m
//  编码对象
//
//  Created by YZH on 2018/2/14.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "Student.h"

@implementation Student

-(id)init:(NSString *)sno name:(NSString *)name score:(NSNumber*)score{
    if (self=[super init]) {
        _sno=sno;
        _name=name;
        _score=score;
    }
    return self;
}

//编码时调用
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:_sno forKey:@"sno"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_score forKey:@"score"];
}
//解码是调用
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    _sno=[aDecoder decodeObjectForKey:@"sno"];
    _name=[aDecoder decodeObjectForKey:@"name"];
    _score=[aDecoder decodeObjectForKey:@"score"];
    return self;
}

@end
