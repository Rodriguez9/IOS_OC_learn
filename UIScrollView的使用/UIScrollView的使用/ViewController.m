//
//  ViewController.m
//  UIScrollView的使用
//
//  Created by Jarvis on 2021/2/15.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(strong,nonatomic)UIImageView *img;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 640, 320)];
    scroll.maximumZoomScale = 5;
    scroll.minimumZoomScale = 0.5;
    //滚动内容的大小
    scroll.contentSize = CGSizeMake(1242, 2208);
    scroll.delegate = self;
    //偏移量
    scroll.contentOffset = CGPointMake(320, 640);
    //设置内容边距
    scroll.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.view addSubview:scroll];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpeg"]];
    [scroll addSubview:img];
    self.img = img;
}

//只要滚动就调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

//缩放就调用
- (void)scrollViewDidZoom:(UIScrollView *)scrollView API_AVAILABLE(ios(3.2)){
    
}

//开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

//即将结束拖拽
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset API_AVAILABLE(ios(5.0)){
    
}

//结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

//开始减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}

//完成减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

//缩放控件
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.img;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    
}

@end
