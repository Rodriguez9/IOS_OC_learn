//
//  ViewController.m
//  UIScrollView喜马拉雅
//
//  Created by Jarvis on 2021/2/15.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *lastImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat y = CGRectGetMaxY(self.lastImg.frame);
    self.scrollView.contentSize = CGSizeMake(0, y+self.lastImg.frame.size.height+30);
}


@end
