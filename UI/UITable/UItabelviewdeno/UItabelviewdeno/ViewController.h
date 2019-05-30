//
//  ViewController.h
//  UItabelviewdeno
//
//  Created by YZH on 2018/2/1.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview1;
@property (strong, nonatomic) NSArray *city;
@end

