//
//  Class+CoreDataProperties.h
//  CoreDatatest
//
//  Created by YZH on 2018/2/16.
//  Copyright © 2018年 YZH. All rights reserved.
//
//

#import "Class+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Class (CoreDataProperties)

+ (NSFetchRequest<Class *> *)fetchRequest;

@property (nonatomic) int16_t classid;
@property (nullable, nonatomic, copy) NSString *classname;
@property (nullable, nonatomic, retain) NSSet<Student *> *classstudent;

@end

@interface Class (CoreDataGeneratedAccessors)

- (void)addClassstudentObject:(Student *)value;
- (void)removeClassstudentObject:(Student *)value;
- (void)addClassstudent:(NSSet<Student *> *)values;
- (void)removeClassstudent:(NSSet<Student *> *)values;

@end

NS_ASSUME_NONNULL_END
