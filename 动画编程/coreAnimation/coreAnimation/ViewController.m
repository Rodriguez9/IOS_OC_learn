//
//  ViewController.m
//  coreAnimation
//
//  Created by YZH on 2018/2/27.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
CALayer* myLayer;
UIImageView* image;
- (void)viewDidLoad {
    [super viewDidLoad];
    image= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"011"]];
    image.frame=CGRectMake(150, 200, 100, 100);
    [self.view addSubview:image];
    // Do any additional setup after loading the view, typically from a nib.
    //[self testLayerProperty];
   // [self caBasicAnimate];
    [self keyFramAnimate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testLayerProperty{
    myLayer = [[CALayer alloc] init];
    myLayer.backgroundColor=[[UIColor magentaColor] CGColor];
    myLayer.borderColor=[[UIColor orangeColor] CGColor];
    myLayer.borderWidth=10.0f;
    myLayer.cornerRadius=10.0;
    myLayer.shadowColor= [[UIColor blackColor] CGColor];
    myLayer.shadowOffset=CGSizeMake(15.0, 15.0);
    myLayer.shadowOpacity=1;
    myLayer.frame=CGRectMake(100, 100, 100, 100);
    [self.view.layer addSublayer:myLayer];
}

-(void)caBasicAnimate{
    //选角色
    CALayer* layer = image.layer;
    //写剧本
    CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue=[NSNumber numberWithFloat:1.5];
    scaleAnimation.autoreverses=true;
    scaleAnimation.repeatCount=MAXFLOAT;
    scaleAnimation.duration=2.0;
    //写剧本2
    CABasicAnimation* alaphAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alaphAnimation.fromValue=[NSNumber numberWithFloat:0.0];
    alaphAnimation.toValue=[NSNumber numberWithFloat:1.0];
    alaphAnimation.autoreverses=true;
    alaphAnimation.repeatCount=MAXFLOAT;
    alaphAnimation.duration=2.0;
    
    [layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    [layer addAnimation:alaphAnimation forKey:@"alaphAnimation"];
}

-(void)keyFramAnimate{
    CALayer* layer = image.layer;
    
    NSValue* value1 = [NSValue valueWithCGPoint:layer.position];
    NSValue* value2 = [NSValue valueWithCGPoint:CGPointMake(layer.position.x, layer.position.y+200)];
    NSValue* value3 = [NSValue valueWithCGPoint:CGPointMake(layer.position.x-200, layer.position.y+200)];
    NSValue* value4 = [NSValue valueWithCGPoint:CGPointMake(layer.position.x-200, layer.position.y)];
    NSValue* value5 = [NSValue valueWithCGPoint:layer.position];
    NSNumber* one=[NSNumber numberWithInt:1];
    NSNumber* two=[NSNumber numberWithInt:2];
    NSNumber* three=[NSNumber numberWithInt:1];
    NSNumber* four=[NSNumber numberWithInt:2];
    NSNumber* five=[NSNumber numberWithInt:1];
    CAKeyframeAnimation* keyAnimate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimate.values=[NSArray arrayWithObjects:value1,value2,value3,value4,value5, nil];
    keyAnimate.keyTimes=[NSArray arrayWithObjects:one,two,three,four,five, nil];
    CAMediaTimingFunction* tf0 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    CAMediaTimingFunction* tf1 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    CAMediaTimingFunction* tf2 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    CAMediaTimingFunction* tf3 = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
   // keyAnimate.timingFunctions =[NSArray arrayWithObjects:tf0,tf1,tf2,tf3, nil];
    
    keyAnimate.autoreverses=false;
    keyAnimate.repeatCount=MAXFLOAT;
    //keyAnimate.duration=7.0;
    [layer addAnimation:keyAnimate forKey:@"keyAnimate"];
}

@end
