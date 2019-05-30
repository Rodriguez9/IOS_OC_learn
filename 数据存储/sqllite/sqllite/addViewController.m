//
//  addViewController.m
//  sqllite
//
//  Created by YZH on 2018/2/9.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "addViewController.h"
#import "SQLManul.h"
#import "Student.h"
@interface addViewController ()

@end

@implementation addViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    NSLog(@"%@", segue.identifier);
    if ([segue.identifier isEqual:@"AddUser"]) {
        Student *model = [[Student alloc] init];
        model.id=self.idnum.text;
        model.name=self.nametextfield.text;
        [[SQLManul shareManager] insert:model];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
