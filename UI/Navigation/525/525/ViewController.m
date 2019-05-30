//
//  ViewController.m
//  525
//
//  Created by YZH on 2018/2/7.
//  Copyright © 2018年 YZH. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title=@"vc1";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStyleDone target:self action:@selector(addclick)];
}
//委托
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqual:@"segue1"]){
        ((ViewController2*)segue.destinationViewController).name=@"sundy";
    }
}

-(void)addclick{
    //[self.navigationController pushViewController:ViewController2 animated:true];
    //加载storyboard，Main为默认，Second为storyboardID
    UIStoryboard *mainstoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController2 *second =[mainstoryboard instantiateViewControllerWithIdentifier:@"Second"];
    second.name=@"123";
   // [self.navigationController pushViewController:second animated:true];
    [self.navigationController showViewController:second sender:nil];
}
- (IBAction)uwn:(UIStoryboardSegue *)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
