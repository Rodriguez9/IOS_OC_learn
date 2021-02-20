//
//  ViewController.m
//  test2
//
//  Created by Jarvis on 2021/2/10.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField* testFiled;
@property(nonatomic,strong)UIDatePicker *datepicker;

@property(nonatomic,retain) UITextField * phoneNumberTextField;
@property(retain,nonatomic)UIDatePicker *datePicker;
@end

@implementation ViewController

- (UITextField *)testFiled{
    if (!_testFiled) {
        _testFiled = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        _testFiled.backgroundColor = UIColor.blueColor;
        _testFiled.textColor = UIColor.grayColor;
        _testFiled.tintColor = UIColor.darkGrayColor;
        _testFiled.inputView = self.datepicker;
    }
    return _testFiled;
}

- (UIDatePicker *)datepicker{
    if (!_datepicker) {
        _datepicker = [[UIDatePicker alloc] init];
        _datepicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_cn"];
        _datepicker.datePickerMode = UIDatePickerModeDateAndTime;
        _datepicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
        [_datepicker addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    }
    return _datepicker;
}

-(void)change:(UIDatePicker *)picker{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    // yyyy MM dd mm ss hh->HH 24h
    [format setDateFormat:@"yyyy-MM-dd HH:mm"];
    self.testFiled.text = [format stringFromDate:picker.date];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.view addSubview:self.datepicker];
    [self.view addSubview:self.testFiled];
}



@end
