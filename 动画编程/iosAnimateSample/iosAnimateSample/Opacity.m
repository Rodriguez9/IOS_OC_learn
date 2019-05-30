//
//  Opacity.m
//  iosAnimateSample
//
//  Created by YZH on 2018/2/26.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "Opacity.h"

@interface Opacity ()
@property (weak, nonatomic) IBOutlet UIView *blue;

@end

@implementation Opacity

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:2 animations:^{
       self.blue.alpha=0.3;
    }];
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
