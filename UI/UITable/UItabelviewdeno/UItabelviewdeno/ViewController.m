//
//  ViewController.m
//  UItabelviewdeno
//
//  Created by YZH on 2018/2/1.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"
#import "citycellTableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableview1.dataSource=self;
    _tableview1.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
    _city = [[NSArray alloc]initWithObjects:@"成都",@"北京",@"上海",@"广州",@"深圳", nil];
}

//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _city.count;
   
}

//每一行内容显示
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid =@"sundycell";
     static NSString *cellid2 =@"sundycell2";
    citycellTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    citycellTableViewCell* cell1 = [tableView dequeueReusableCellWithIdentifier:cellid2];
//    if (cell==nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
//    }
    
   //[cell.citylabel setText:_city[indexPath.row]];
    //cell.citylabel.text=_city[indexPath.row];
    UILabel* label1 =[cell viewWithTag:1];
     UILabel* label2 =[cell1 viewWithTag:1];
    UITextView* texy1 =[cell viewWithTag:2];
    label1.text=_city[indexPath.row];
    texy1.text=@"123";
    label2.text=@"1111111111111111";
    cell.accessoryType=UITableViewCellAccessoryDetailButton;
    if (indexPath.row%2==0) {
        return cell1;
    }else{
        return cell;}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
