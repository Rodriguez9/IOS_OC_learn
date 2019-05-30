//
//  ViewController.m
//  JSONtext1
//
//  Created by YZH on 2018/3/3.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)jsonparson:(UIButton *)sender {
    //NSString *js = @"{\"name\":\"James\",\"age\":\"30\"}";
    //NSString *js = @"{\"user\":{\"name\":\"James\",\"age\":\"30\"}}";
    //NSString *js =@"[{\"name\":\"james\"},{\"name\":\"30\"}]";
    //NSString *js =@"{\"user\":[{\"name\":\"james\"},{\"name\":\"Jim\"}]}";
    NSURL* url = [NSURL URLWithString:@"http://www.weather.com.cn/weather1d/101281601.shtml"];
    NSLog(url);
    //NSData *datajs = [js dataUsingEncoding:NSUTF8StringEncoding];
    NSData *datajs = [NSData dataWithContentsOfURL:url];
   id jsobh= [NSJSONSerialization JSONObjectWithData:datajs options:NSJSONReadingAllowFragments error:nil];
    if ([jsobh isKindOfClass:[NSDictionary class]]) {
        NSDictionary* dic = (NSDictionary *)jsobh;
        NSArray* arr = [dic objectForKey:@"user"];
        for (NSDictionary *dic in arr) {
            _parseresult.text=[_parseresult.text stringByAppendingString:[dic objectForKey:@"name"]];
        }
        
    }
    if ([jsobh isKindOfClass:[NSArray class]]) {
        NSArray* arr = (NSArray *)jsobh;
        for (NSDictionary *dic in arr) {
            _parseresult.text=[_parseresult.text stringByAppendingString:[dic objectForKey:@"name"]];
        }
    }
}
@end
