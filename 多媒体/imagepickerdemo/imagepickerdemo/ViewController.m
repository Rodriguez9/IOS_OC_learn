//
//  ViewController.m
//  imagepickerdemo
//
//  Created by YZH on 2018/2/16.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property(strong,nonatomic)UIImagePickerController *imagePickerCon;
- (IBAction)button1:(UIButton *)sender;

@end

@implementation ViewController
//懒加载:重写
-(UIImagePickerController *)imagePickerCon{
    if (!_imagePickerCon) {
        _imagePickerCon = [[UIImagePickerController alloc] init];
        //采集元类型
        _imagePickerCon.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //媒体类型
        _imagePickerCon.mediaTypes = [NSArray arrayWithObject:(__bridge NSString *)kUTTypeImage];
       
        //设置代理
        _imagePickerCon.delegate=self;
    }
    return _imagePickerCon;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)button1:(UIButton *)sender {
    //通过摄像头
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.imagePickerCon.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else{
        //通过图片库
        self.imagePickerCon.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
       
    }
    //模态
    [self presentViewController:_imagePickerCon animated:YES completion:nil];
}

//完成采集后会掉处理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取媒体类型
    NSString *type = info[UIImagePickerControllerMediaType];
    if ([type isEqualToString:(__bridge NSString *)kUTTypeImage]) {
       // UIImage *image1 = info[UIImagePickerControllerEditedImage];
        //获取采集到的图片
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        //显示
        self.imageview.image=image;
        
    }
    [_imagePickerCon dismissViewControllerAnimated:true completion:nil];
}
//取消采集图片处理
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"NO");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
