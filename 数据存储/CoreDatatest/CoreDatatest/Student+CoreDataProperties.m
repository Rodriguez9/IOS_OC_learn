//
//  Student+CoreDataProperties.m
//  CoreDatatest
//
//  Created by YZH on 2018/2/16.
//  Copyright © 2018年 YZH. All rights reserved.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic studentAge;
@dynamic studentId;
@dynamic studentName;
@dynamic studentclass;
@dynamic studentCourse;

@end
