//
//  Spring.m
//  iosAnimateSample
//
//  Created by YZH on 2018/2/27.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "Spring.h"

@interface Spring ()
@property (weak, nonatomic) IBOutlet UIView *green;
@property (weak, nonatomic) IBOutlet UIView *red;
@property (weak, nonatomic) IBOutlet UIView *blue;

@end

@implementation Spring

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0 options:nil animations:^{
        CGPoint temp = self.green.center;
        temp.x=self.view.bounds.size.width-temp.x;
        self.green.center=temp;
    } completion:nil];

}

@end
