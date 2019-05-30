//
//  ViewController.m
//  test
//
//  Created by YZH on 2018/1/26.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textfield1;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.textfield1.delegate=self;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeprogress:) userInfo:nil repeats:true];
   // self.doanimate;
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)doanimate{
    NSMutableArray *images=[[NSMutableArray alloc]init];
    UIImage *image;
    NSString *imageName;
   int index=0;
    for(;index<=67;index++){
        NSString *str =[[NSString alloc]initWithFormat:@"%d",index];
        
       NSLog(str);
        imageName = [[NSString alloc]initWithFormat:@"logo-%@",str];
        NSLog(imageName);
        image =[UIImage imageNamed:imageName];
        NSLog(imageName);
        [images addObject:image];
    }
    
    _imageview1.animationImages =images;
    _imageview1.animationRepeatCount = 15;
    _imageview1.animationDuration = 5;
    
    _imageview1.startAnimating;
}
-(void)changeprogress:(NSTimer *)sender{
    _progress.progress+=0.1;
    if (_progress.progress>=1) {
        sender.invalidate;
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"开始");
    return true;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"开始编辑");
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"结束编辑");
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"结束");
    return true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)textfield2:(UITextField *)sender {
    sender.resignFirstResponder;
}

- (IBAction)denglu:(UIButton *)sender {
    if ([textfield1.text isEqualToString:@"123"]&&[_textfield2.text isEqualToString:@"123"]) {//!
        NSLog(@"success");
    }
    else{
        NSLog(textfield1.text);
    NSLog(_textfield2.text);
        NSLog(@"fail");}
}

- (IBAction)control1:(UIControl *)sender {
    textfield1.resignFirstResponder;
}

- (IBAction)text1:(UITextField *)sender {
    sender.resignFirstResponder;
}

- (IBAction)segmentValue:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.view.backgroundColor=[UIColor blueColor];
            break;
        case 1:
            self.view.backgroundColor=[UIColor blackColor];
            break;
        case 2:
            self.view.backgroundColor=[UIColor yellowColor];
            break;
        default:
            break;
    }
}

- (IBAction)add:(UIButton *)sender {
    [self.seg1 insertSegmentWithTitle:@"four" atIndex:_seg1.numberOfSegments animated:true];
}
- (IBAction)switch:(UISwitch *)sender {
    if(sender.on){
        NSLog(@"开");
        _aiv1.startAnimating;
        self.view.backgroundColor = [UIColor redColor];
    }
    else{
       NSLog(@"关");
    _aiv1.stopAnimating;
        self.view.backgroundColor = [UIColor whiteColor];}
}
- (IBAction)step:(UIStepper *)sender {
    _textfield2.text=[[NSString alloc]initWithFormat:@"%g", sender.value];
}

- (IBAction)datachangge:(UIDatePicker *)sender {
    NSDateFormatter* format = [[NSDateFormatter alloc]init];
    format.dateStyle = NSDateFormatterFullStyle;
    //format.dateStyle="yyyy年MM月dd日，HH时mm分ss秒";
    //把Datapicker的date日期转化为string
    NSString* data=[format stringFromDate:sender.date];
    NSLog(data);
   // sender.countDownDuration
}
- (IBAction)alertbutton:(UIButton *)sender {
    UIAlertController* alet = [UIAlertController alertControllerWithTitle:@"确认关闭吗" message:@"是否关闭当前窗体" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* Default =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction* action){
       NSLog(@"123");
   }];
    UIAlertAction* Defaultq =[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction* action){
        NSLog(@"123");
    }];
    
    [alet addAction:Default];
     [alet addAction:Defaultq];
    [self presentViewController:alet animated:YES completion:nil];
    //UIAlertAction* default = [UIAlertAction actionWithTitle:@"ok"];
   
}

- (IBAction)daoshu:(UIButton *)sender {
    _date1.countDownDuration+=60;
}
@end
