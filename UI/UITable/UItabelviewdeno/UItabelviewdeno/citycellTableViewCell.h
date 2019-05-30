//
//  citycellTableViewCell.h
//  UItabelviewdeno
//
//  Created by YZH on 2018/2/2.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface citycellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *cityswitch;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UILabel *citylabel;

@end
