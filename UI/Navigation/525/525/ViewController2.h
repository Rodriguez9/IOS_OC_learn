//
//  ViewController2.h
//  525
//
//  Created by YZH on 2018/2/7.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
@property(nonatomic)NSString* name;
@property (weak, nonatomic) IBOutlet UILabel *label1;

- (IBAction)uwn:(UIStoryboardSegue *)sender;
@end
