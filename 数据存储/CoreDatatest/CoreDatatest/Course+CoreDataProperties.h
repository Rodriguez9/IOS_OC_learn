//
//  Course+CoreDataProperties.h
//  CoreDatatest
//
//  Created by YZH on 2018/2/16.
//  Copyright © 2018年 YZH. All rights reserved.
//
//

#import "Course+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Course (CoreDataProperties)

+ (NSFetchRequest<Course *> *)fetchRequest;

@property (nonatomic) int16_t chapter;
@property (nonatomic) int16_t courseid;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Student *> *coursestudent;

@end

@interface Course (CoreDataGeneratedAccessors)

- (void)addCoursestudentObject:(Student *)value;
- (void)removeCoursestudentObject:(Student *)value;
- (void)addCoursestudent:(NSSet<Student *> *)values;
- (void)removeCoursestudent:(NSSet<Student *> *)values;

@end

NS_ASSUME_NONNULL_END
