//
//  Student+CoreDataProperties.h
//  CoreDatatest
//
//  Created by YZH on 2018/2/16.
//  Copyright © 2018年 YZH. All rights reserved.
//
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nonatomic) int16_t studentAge;
@property (nonatomic) int16_t studentId;
@property (nullable, nonatomic, copy) NSString *studentName;
@property (nullable, nonatomic, retain) Class *studentclass;
@property (nullable, nonatomic, retain) Course *studentCourse;

@end

NS_ASSUME_NONNULL_END
