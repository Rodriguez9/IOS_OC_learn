//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by YZH on 2018/2/5.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView1;

@end

@implementation ViewController

    NSArray* _image;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _collectionView1.dataSource=self;
    _collectionView1.delegate=self;
    _image = @[@"01.gif",@"02.gif",@"03.gif",@"04.gif",@"05.gif",@"06.gif",@"07.gif",@"08.gif",@"09.gif"];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _image.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"sundycell" forIndexPath:indexPath];
   UIImageView* imageView1 = [cell  viewWithTag:1];
    imageView1.image=[UIImage imageNamed:_image[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2==0) {
        return CGSizeMake(200, 200);
    }else
        return CGSizeMake(100, 100);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
