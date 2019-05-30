//
//  ViewController.m
//  UINavbarDemo
//
//  Created by YZH on 2018/2/6.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
int count=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addClick:(UIBarButtonItem *)sender {
    count++;
    self.addOneMode;
}

-(void)addOneMode{
    UINavigationItem* item = [[UINavigationItem alloc] initWithTitle:@"count\(count)"];
    item.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addOneMode)];
    item.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(redu)];
    [_navbar1 pushNavigationItem:item animated:true];
}
-(void)redu{
    count--;
    [_navbar1 popNavigationItemAnimated:true];
}


@end
