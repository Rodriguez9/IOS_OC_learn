//
//  ViewController.m
//  编码对象
//
//  Created by YZH on 2018/2/14.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
@interface ViewController ()

@end

@implementation ViewController
#define KNameFile (@"/student.archive")
-(NSString *)applicationDocumentsDirectoryFile{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory =[path firstObject];
    NSString *filePath = [documentDirectory stringByAppendingString:KNameFile];
    NSLog(@"%@", filePath);
    return filePath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   //归档操作
    //创建对象
    Student *student=[[Student alloc]init:@"1101" name:@"maizi" score:@99];
    //归档对象
    [NSKeyedArchiver archiveRootObject:student toFile:[self applicationDocumentsDirectoryFile]];
    //解当操作
    Student *object = [NSKeyedUnarchiver unarchiveObjectWithFile:[self applicationDocumentsDirectoryFile]];
    NSLog(@"%@", object.sno);
    NSLog(@"%@", object.name);
    NSLog(@"%@", object.score);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
