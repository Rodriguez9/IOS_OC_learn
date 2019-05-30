//
//  ViewController.m
//  文件目录管理
//
//  Created by YZH on 2018/2/7.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self getHomePage];
   // [self getDocument];
   // [self getTmp];
    //[self parsePage];
//    [self createFolder];
//    [self createFile];
//    [self writeFile];
    //[self addFile];
    //[self deleteFile];
    [self writeImage];
    // Do any additional setup after loading the view, typically from a nib.
}

//获取沙盒的路径
-(NSString *)getHomePage{
    NSString *homePage = NSHomeDirectory();
    NSLog(@"homePage=%@", homePage);
    return homePage;
}

//获取Document的路径
-(NSString *)getDocument{
    //检索指定路径
    //第一个参数制定了收缩的路径名称,NSLibraryDirectory
    //第2个参数限定在沙盒内
    NSArray *DocuPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentPath =[DocuPath lastObject];
    NSLog(@"documentPath=%@",documentPath);
    return documentPath;
}

-(NSString *)getTmp{
    //检索指定路径
    //第一个参数制定了收缩的路径名称,NSLibraryDirectory
    //第2个参数限定在沙盒内
    NSString *TemPath = NSTemporaryDirectory();
    NSLog(@"TemPath=%@",TemPath);
    return TemPath;
}

-(void)parsePage{
    NSString *path=@"/Users/yzh/Desktop/1.rtf";
    //获得路径的各个组成部分
    NSArray *array=[path pathComponents];
    NSLog(@"arrat=%@",array);
    //提取路径的最后一个组成部分
    NSString *name = [path lastPathComponent];
    NSLog(@"name=%@",name);
    //删除路径的最后一个组成部分
    NSString *dtring = [path stringByDeletingLastPathComponent];
    NSLog(@"lastPath=%@",dtring);
    //追加name.txt
    NSString *addString = [dtring stringByAppendingPathComponent:@"name.txt"];
    NSLog(@"addString=%@",addString);
}

//数据转换示例
-(void)dataChange:(NSData *)data{
    //NSData->NsString
    NSString *astring = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSString->NSData
    NSData *aData = [astring dataUsingEncoding:NSUTF8StringEncoding];
    //NSData->UIImage
    UIImage *image = [UIImage imageWithData:aData];
    //NSData<-UIImage
    NSData *data2 = UIImagePNGRepresentation(image);
}

//创建文件夹
-(void)createFolder{
    NSString *docPath =@"/Users/yzh/Desktop/";// [self getDocument];
    NSString *testPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL ret = [manager createDirectoryAtPath:testPath withIntermediateDirectories:false attributes:nil error:nil];
    if (ret) {
        NSLog(@"success");
    }else{
        NSLog(@"fail");
    }
    
}

//创建文件
-(void)createFile{
    NSString *docPath =@"/Users/yzh/Desktop/";// [self getDocument];
    NSString *testPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    NSString *filePath = [testPath stringByAppendingPathComponent:@"我的笔记.txt"];
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL ret =  [manager createFileAtPath:filePath contents:nil attributes:nil];
    if (ret) {
        NSLog(@"filesuccess");
    }else{
        NSLog(@"filefail");
    }
}

//写入文件
-(void)writeFile{
    NSString *docPath =@"/Users/yzh/Desktop/";// [self getDocument];
    NSString *testPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    NSString *filePath = [testPath stringByAppendingPathComponent:@"我的笔记.txt"];
    NSString *content = @"hello，world！";
    BOOL ret = [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (ret) {
        NSLog(@"writesuccess");
    }else{
        NSLog(@"writefail");
    }
}

//是否存在
-(BOOL)FileExist:(NSString *)filePath{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]) {
        return true;
    }else{
        return false;
    }
}

//追加内容
-(void)addFile{
    NSString *docPath =@"/Users/yzh/Desktop/";// [self getDocument];
    NSString *testPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    NSString *filePath = [testPath stringByAppendingPathComponent:@"我的笔记.txt"];
    NSString *content = @"aaaaaaaaaa！";
    //打开文件 准备更新
    NSFileHandle *fileHandle =[NSFileHandle fileHandleForUpdatingAtPath:filePath];
    //将节点已到最后
    [fileHandle seekToEndOfFile];
    NSData *stringData = [content dataUsingEncoding:NSUTF8StringEncoding];
    [fileHandle writeData:stringData];
    [fileHandle closeFile];
};

//删除
-(void)deleteFile{
    NSString *docPath =@"/Users/yzh/Desktop/";// [self getDocument];
    NSString *testPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    NSString *filePath = [testPath stringByAppendingPathComponent:@"我的笔记.txt"];
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL ret = [self FileExist:filePath];
    if (ret) {
        BOOL ret2=[manager removeItemAtPath:filePath error:nil];
        if (ret2) {
             NSLog(@"success");
        }
        else{
             NSLog(@"fail");
        }
    }else
        return;
}

//写入图片
-(void)writeImage{
    UIImage *testImage =[UIImage imageNamed:@"08@2x.gif"];
    NSData *data = UIImagePNGRepresentation(testImage);
    NSString *docPath =@"/Users/yzh/Desktop/";// [self getDocument];
    NSString *testPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    NSString *filePath = [testPath stringByAppendingPathComponent:@"图片"];
    [data writeToFile:filePath atomically:YES];
    NSFileManager *manager = [NSFileManager defaultManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
