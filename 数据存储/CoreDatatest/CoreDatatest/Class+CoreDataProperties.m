//
//  Class+CoreDataProperties.m
//  CoreDatatest
//
//  Created by YZH on 2018/2/16.
//  Copyright © 2018年 YZH. All rights reserved.
//
//

#import "Class+CoreDataProperties.h"

@implementation Class (CoreDataProperties)

+ (NSFetchRequest<Class *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Class"];
}

@dynamic classid;
@dynamic classname;
@dynamic classstudent;

@end
