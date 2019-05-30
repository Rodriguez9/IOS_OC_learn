//
//  TableViewController.h
//  LessionMedia
//
//  Created by YZH on 2018/2/23.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChooseFileDelegate<NSObject>
 -(void)didChooseFileName:(NSString *)fileName;
@end

@interface TableViewController : UITableViewController
@property(weak)id<ChooseFileDelegate>delegate;
@end
