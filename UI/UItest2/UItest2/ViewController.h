//
//  ViewController.h
//  UItest2
//
//  Created by YZH on 2018/2/1.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerview1;
@property (strong, nonatomic) NSArray *province;
@property (strong, nonatomic) NSDictionary *city;
@property (weak, nonatomic) IBOutlet UIScrollView *Scrollview;
@property (strong, nonatomic) NSString *selectValue;
- (IBAction)pagecontrol:(UIPageControl *)sender;
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol1;
@end

