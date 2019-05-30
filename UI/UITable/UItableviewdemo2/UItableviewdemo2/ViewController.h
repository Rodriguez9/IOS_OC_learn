//
//  ViewController.h
//  UItableviewdemo2
//
//  Created by YZH on 2018/2/2.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray* _privince;
    NSDictionary* city;
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(strong,nonatomic)NSArray* privince;
@property(strong,nonatomic)NSMutableArray* siChuan;
@property(strong,nonatomic)NSMutableArray* GuangDong;
@property(strong,nonatomic)NSMutableArray* GuangXi;
- (IBAction)editbuttonclick:(UIBarButtonItem*)sender;
- (IBAction)insertbuttonclick:(UIBarButtonItem *)sender;
@property(strong,nonatomic)NSDictionary* city;
@end

