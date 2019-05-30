//
//  ViewController.m
//  LessionMedia
//
//  Created by YZH on 2018/2/16.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
@interface ViewController ()

@end

@implementation ViewController
MPMoviePlayerController* mpc;
MPMoviePlayerViewController* mpvc;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    TableViewController* chooseVC=segue.destinationViewController;
    chooseVC.delegate=self;
}
-(void)didChooseFileName:(NSString *)fileName{
   NSString* filepath= [[NSBundle mainBundle] pathForResource:fileName ofType:@"mp4"];
    mpc.contentURL=[NSURL fileURLWithPath:filepath];
    mpc.play;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString* filepath= [[NSBundle mainBundle] pathForResource:@"Swift第一讲_compress" ofType:@"mp4"];
    mpc=[[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:filepath]];
    mpc.view.frame=CGRectMake(20, 30, 200, 200);
    mpc.view.backgroundColor=[UIColor redColor];
    [self.view addSubview:mpc.view];
    mpc.play;
    mpc.controlStyle=MPMovieControlStyleEmbedded;
    mpc.scalingMode=MPMovieScalingModeAspectFit;
    mpvc=[[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL fileURLWithPath:filepath]];
}

- (IBAction)moviebutton:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [self presentMoviePlayerViewControllerAnimated:mpvc];
            break;
            
        case 2:
            mpc.play;
            break;
        case 3:
            mpc.pause;
            break;
        case 4:
            mpc.stop;
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
