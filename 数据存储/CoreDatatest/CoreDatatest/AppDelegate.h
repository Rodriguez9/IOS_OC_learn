//
//  AppDelegate.h
//  CoreDatatest
//
//  Created by YZH on 2018/2/14.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Student+CoreDataProperties.h"
#import "Student+CoreDataClass.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
- (void)insertStudent;
- (void)selectStudent;
- (void)deleteStudent;
- (void)updateStudent;
@end

