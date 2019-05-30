//
//  ViewController.m
//  UItableviewdemo2
//
//  Created by YZH on 2018/2/2.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int mark=1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableview.dataSource=self;
    _tableview.delegate=self;
    _privince=@[@"四川",@"广东",@"广西"];
    _siChuan=[[NSMutableArray alloc] init];
    _GuangDong=[[NSMutableArray alloc] init];
    _GuangXi=[[NSMutableArray alloc] init];
    [_siChuan addObject:@"成都"];
    [_siChuan addObject:@"绵羊"];
    [_siChuan addObject:@"成都"];
    [_GuangXi addObject:@"梧州"];
    [_GuangXi addObject:@"北海"];
    [_GuangDong addObject:@"东莞"];
    _city = @{@"四川":_siChuan, @"广东":_GuangDong,@"广西":_GuangXi};
    
}

//section名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _privince[section];
}

//显示内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellId=@"sundycell";
    
    UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    NSString* proname = _privince[indexPath.section];
    cell.textLabel.text=_city[proname][indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDetailButton;
    return cell;
}

//索引
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _privince;
}

//点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"123");
}

//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray* provincename = _privince[section];
    return [_city[provincename] count];
}
//返回section数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _privince.count;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//允许那些行
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

//返回编辑状态
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (mark==1) {
        return UITableViewCellEditingStyleInsert;
    } else{
        return UITableViewCellEditingStyleDelete;
    }
}

//删除弹出框
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return @"确认删除";
}

//点击删除列表触发
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //删除数组元素，删除单元格
        //得到城市名
         NSString* proname = _privince[indexPath.section];
    if(mark==2){
    //删除字典
        [_city[proname] removeObjectAtIndex:indexPath.row];
    //删除tableview
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }else{
        //得到当前项的城市名字
        [_city[proname] insertObject:(_city[proname][indexPath.row]) atIndex:indexPath.row+1];
        //添加到tableview
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
//移动单元格。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
//是否能移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

//移动到目标位置
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSString* proName = _privince[sourceIndexPath.section];
    NSString* cueCity = _city[proName][sourceIndexPath.row];
    [_city[proName] removeObjectAtIndex:sourceIndexPath.row];
    [_city[proName] insertObject:cueCity atIndex:destinationIndexPath.row];
    [tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}
//。。。。。。。。。。。。。。。。。。。。。。。。
- (IBAction)editbuttonclick:(UIBarButtonItem*)sender {
    //进入编辑状态
    mark=2;
    [_tableview setEditing:!_tableview.editing animated:true];
    if (_tableview.editing) {
        sender.title=@"Done";
       
    }else{
        sender.title=@"Edit";
    }
}

- (IBAction)insertbuttonclick:(UIBarButtonItem *)sender {
    mark=1;
    [_tableview setEditing:!_tableview.editing animated:true];
    if (_tableview.editing) {
        sender.title=@"Done";
        // [_tableview setEditing:false animated:true];
    }else{
        sender.title=@"insert";
    }
}
@end
