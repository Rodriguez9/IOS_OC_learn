//
//  ViewController.h
//  test
//
//  Created by YZH on 2018/1/26.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    UILabel* m2;
}
@property (weak, nonatomic) IBOutlet UITextField *textfield1;
@property (weak, nonatomic) IBOutlet UITextField *textfield2;
- (IBAction)textfield2:(UITextField *)sender;
- (IBAction)denglu:(UIButton *)sender;
- (void)doanimate;
- (void)changeprogress:(NSTimer *)sender;
- (IBAction)control1:(UIControl *)sender;
- (IBAction)text1:(UITextField *)sender;
- (IBAction)segmentValue:(UISegmentedControl *)sender;
- (IBAction)add:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg1;
- (IBAction)switch:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aiv1;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
- (IBAction)step:(UIStepper *)sender;
- (IBAction)datachangge:(UIDatePicker *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageview1;
- (IBAction)alertbutton:(UIButton *)sender;
- (IBAction)daoshu:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *date1;


@end

