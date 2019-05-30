//
//  Scale.m
//  iosAnimateSample
//
//  Created by YZH on 2018/2/26.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "Scale.h"

@interface Scale ()
@property (weak, nonatomic) IBOutlet UIView *Sblue;
@property (weak, nonatomic) IBOutlet UIView *b2;
@property (weak, nonatomic) IBOutlet UILabel *l1;

@end

@implementation Scale

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:1 animations:^{
        self.Sblue.transform=CGAffineTransformMakeScale(0.5, 0.5);
        self.b2.backgroundColor= [UIColor redColor];
        self.l1.textColor=[UIColor yellowColor];
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
