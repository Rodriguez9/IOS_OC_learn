//
//  ViewController.m
//  qrcode
//
//  Created by YZH on 2018/2/27.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageqrcode;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *weather;
@property (weak, nonatomic) IBOutlet UILabel *tempuater;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlstr =@"http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json";
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:@"http://api.k780.com:88/?app=qr.get&data=test&level=L&size=6"]
            completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                if (error==nil) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.imageqrcode.image=[UIImage imageWithData:data];
                    });
                }
            }] resume];
    
//    [[session dataTaskWithURL:[NSURL URLWithString:url]
//            completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
//                if (error==nil) {
//                   id jsondata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//                    if ([jsondata isKindOfClass:[NSDictionary class]]) {
//                         NSDictionary* dic = (NSDictionary *)jsondata;
//                        NSArray* dic1=[dic objectForKey:@"result"];
//                        NSDictionary* dic2=dic1[0];
//                       // self.tempuater.text=dic2[@"citynm"];
//                        NSLog(dic2[@"citynm"]);
//                        NSLog(dic2[@"temperature"]);
//                        NSLog(dic2[@"wind"]);
//                    }
//                }
//            }] resume];
    
    NSURL *url = [NSURL URLWithString:urlstr];
    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error==nil) {
            id jsondata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            if ([jsondata isKindOfClass:[NSDictionary class]]) {
                NSDictionary* dic = (NSDictionary *)jsondata;
                NSArray* dic1=[dic objectForKey:@"result"];
                NSDictionary* dic2=dic1[0];
                dispatch_async(dispatch_get_main_queue(), ^{
                    _tempuater.text=dic2[@"temperature"];
                    _city.text=dic2[@"citynm"];
                    _weather.text=dic2[@"wind"];
                });
                
            }
    }
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
