//
//  ViewController.m
//  UItest2
//
//  Created by YZH on 2018/2/1.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"
            
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _pickerview1.delegate=self;
    _pickerview1.dataSource=self;
    _province =[[NSArray alloc]initWithObjects:@"四川",@"广东",@"广西", nil];
    _city = @{@"四川":@[@"成都",@"绵羊",@"广元"], @"广东":@[@"东莞"],@"广西":@[@"梧州",@"北海"]};
    _Scrollview.backgroundColor=[UIColor redColor];
    _Scrollview.contentSize=CGSizeMake(320*4, 568);
    
    UIView* aview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    aview.backgroundColor=[UIColor yellowColor];
    [_Scrollview addSubview:aview];
    
    UIView* bview = [[UIView alloc] initWithFrame:CGRectMake(1*320, 0, 1*320, 568)];
    bview.backgroundColor=[UIColor blueColor];
    [_Scrollview addSubview:bview];
    
    UIView* cview = [[UIView alloc] initWithFrame:CGRectMake(2*320, 0, 320, 568)];
    cview.backgroundColor=[UIColor greenColor];
    [_Scrollview addSubview:cview];
    
   // _Scrollview.contentInset=UIEdgeInsetsMake(10, 10, 10, 10);
    //_Scrollview.contentOffset=CGPointMake(10, 10);
    _Scrollview.delegate=self;
    [_pagecontrol1 addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
}

-(void)pageChanged{
    int curPage = _pagecontrol1.currentPage;
    [_Scrollview scrollRectToVisible:CGRectMake(curPage*320, 0, 320, 568) animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//显示内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
         return _province[row];
    }else if(_city[_selectValue]!=nil){
        return _city[_selectValue][row];
    }
    else return nil;
   
}
//设定行宽
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 45.0;
}

//点击事件
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component==0) {
        _selectValue =_province[row];
        _pickerview1.reloadAllComponents;
        [_pickerview1 selectRow:0 inComponent:1 animated:true];
    }
}

//设定列数
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 2;
}
//设定行数
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        return _province.count;
    }else{
    if([_city objectForKey:_selectValue]!=nil){
        NSArray *dicr =[_city objectForKey:_selectValue];
        return dicr.count;
        
    }else return 0;
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //让pageControl跟着变动
    int curpage=scrollView.contentOffset.x/320;
    _pagecontrol1.currentPage=curpage;
    
}
- (IBAction)pagecontrol:(UIPageControl *)sender {
}
@end
