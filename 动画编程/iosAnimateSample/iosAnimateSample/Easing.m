//
//  Easing.m
//  iosAnimateSample
//
//  Created by YZH on 2018/2/27.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "Easing.h"

@interface Easing ()
@property (weak, nonatomic) IBOutlet UIView *green;
@property (weak, nonatomic) IBOutlet UIView *red;
@property (weak, nonatomic) IBOutlet UIView *blue;

@end

@implementation Easing
UIView* mfirst;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mfirst=[[UIView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    mfirst.backgroundColor=[UIColor yellowColor];
    [_green addSubview:mfirst];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGPoint temp = self.green.center;
        temp.x=self.view.bounds.size.width-temp.x;
        self.green.center=temp;
    } completion:nil];
    
    [UIView animateWithDuration:10 delay:1 options:UIViewAnimationOptionOverrideInheritedDuration|UIViewAnimationOptionOverrideInheritedCurve|UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint temp = self.red.center;
        temp.x=self.view.bounds.size.width-temp.x;
        self.red.center=temp;
    } completion:nil];
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint temp = self.blue.center;
        temp.x=self.view.bounds.size.width-temp.x;
        self.blue.center=temp;
    } completion:^(BOOL finish){
        [self zhuanc];
        [self tihuan];
    }];
}

-(void)zhuanc{
    [UIView transitionWithView:mfirst duration:2 options:UIViewAnimationOptionTransitionCurlUp|UIViewAnimationOptionAllowAnimatedContent animations:^{
        mfirst.backgroundColor=[UIColor grayColor];
    } completion:nil];
}

-(void)tihuan{
    UIView* first=[[UIView alloc] initWithFrame:CGRectMake(30, 100, 40, 40)];
    first.backgroundColor=[UIColor brownColor];
    [UIView transitionFromView:_red toView:first duration:2.0 options:UIViewAnimationOptionTransitionCurlUp|UIViewAnimationOptionAllowAnimatedContent completion:nil];
    
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
