//
//  ViewController.m
//  属性列表
//
//  Created by YZH on 2018/2/14.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#define KNameFile (@"/name.plist")

-(NSString *)applicationDocumentsDirectoryFile{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory =[path firstObject];
    NSString *filePath = [documentDirectory stringByAppendingString:KNameFile];
    printf([filePath UTF8String]);
    return filePath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"============>Array");
    //名字的数组
    NSArray *name = @[(@"aaa"),@"bbb",@"ccc"];
    [name writeToFile:self.applicationDocumentsDirectoryFile atomically:true];
    //读取数组，输出结果
    NSArray *entries = [[NSArray alloc]initWithContentsOfFile:self.applicationDocumentsDirectoryFile];
    NSLog(@"%@", entries);
    
    NSLog(@"============>Dictionary");
    NSDictionary *student = @{@"sno":@"1101",@"name":@"maizi",@"score":@"100"};
    [student writeToFile:self.applicationDocumentsDirectoryFile atomically:true];
    NSDictionary *data = [[NSDictionary alloc]initWithContentsOfFile:self.applicationDocumentsDirectoryFile];
    NSLog(@"%@", data);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
