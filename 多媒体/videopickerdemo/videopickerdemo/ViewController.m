//
//  ViewController.m
//  videopickerdemo
//
//  Created by YZH on 2018/2/16.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>{
    NSURL *mediaurl;
}
@property(strong,nonatomic)UIImagePickerController *imagepickercon;
@property(strong,nonatomic)AVPlayerViewController *player;//播放
@end

@implementation ViewController
- (IBAction)playvideo:(UIButton *)sender {
    //播放
    [self.player.player play];
}

-(UIImagePickerController *)imagepickercon{
    if (!_imagepickercon) {
        _imagepickercon = [[UIImagePickerController alloc] init];
        //采集元类型
        _imagepickercon.sourceType=UIImagePickerControllerSourceTypeCamera;
        //媒体类型
        _imagepickercon.mediaTypes=[NSArray arrayWithObject:(__bridge NSString *)kUTTypeMovie];
        _imagepickercon.delegate=self;
    }
    return _imagepickercon;
}

-(AVPlayerViewController *)player{
    if (!_player) {
        _player=[[AVPlayerViewController alloc] init];
        //创建avplayer对象
        _player.player = [[AVPlayer alloc]initWithURL:mediaurl];
        //播放窗口大小
        //1全屏
        [self presentViewController:self animated:YES completion:nil];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pickvideo:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self presentViewController:self.imagepickercon animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取媒体类型
    NSString *type =info[UIImagePickerControllerMediaType];
    if ([type isEqualToString:(__bridge NSString *)kUTTypeMovie]) {
        mediaurl = info[UIImagePickerControllerMediaURL];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
     [self dismissViewControllerAnimated:YES completion:nil];
}


@end
