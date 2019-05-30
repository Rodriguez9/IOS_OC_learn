//
//  Rotation.m
//  iosAnimateSample
//
//  Created by YZH on 2018/2/26.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "Rotation.h"

@interface Rotation ()
@property (weak, nonatomic) IBOutlet UIImageView *uiview;

@end

@implementation Rotation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)turn{
    [UIView animateWithDuration:1 delay:0  options:nil animations:^{
        self.uiview.transform = CGAffineTransformRotate(self.uiview.transform,M_PI);
    } completion:^(BOOL finish){
       [self turn];
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [self turn];
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
