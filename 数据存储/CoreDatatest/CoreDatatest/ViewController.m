//
//  ViewController.m
//  CoreDatatest
//
//  Created by YZH on 2018/2/14.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    AppDelegate *app = [[AppDelegate alloc] init];
   [app insertStudent];
    [app selectStudent];
   // [app deleteStudent];
    [app updateStudent];
}

//-(void)insertStudent{
//    NoteManagerObject
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
