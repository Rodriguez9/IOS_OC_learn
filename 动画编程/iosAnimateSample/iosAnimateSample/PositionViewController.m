//
//  PositionViewController.m
//  iosAnimateSample
//
//  Created by YZH on 2018/2/25.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "PositionViewController.h"

@interface PositionViewController ()
@property (weak, nonatomic) IBOutlet UIView *bluesequare;
@property (weak, nonatomic) IBOutlet UIView *red;


@end

@implementation PositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:1 animations:^{
        
        CGPoint temp = self.bluesequare.center;
        temp.x=self.view.bounds.size.width-temp.x;
        self.bluesequare.center=temp;
    }];
    [UIView animateWithDuration:1 delay:1 options:nil animations:^{
        CGPoint temp = self.red.center;
        temp.x=self.view.bounds.size.width-temp.x;
        self.red.center=temp;
    } completion:nil];
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
