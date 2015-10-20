//
//  SquareViewController.m
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/17.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "SquareViewController.h"

@interface SquareViewController ()

@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.firstVC = [[SquareFirstViewController alloc] init];
    self.firstVC.view.frame = [UIScreen mainScreen].bounds;
    [self addChildViewController:self.firstVC];
    [self.view addSubview:self.firstVC.view];
    
    self.secondVC = [[SquareSecondViewController alloc] init];
    self.secondVC.view.frame = [UIScreen mainScreen].bounds;
    [self addChildViewController:self.secondVC];
    [self.view addSubview:self.secondVC.view];
    [self.view bringSubviewToFront:self.firstVC.view];
    
    self.isOn = NO;
    // Do any additional setup after loading the view.
}

-(void)cutAction:(id)sender
{
//    if (self.isOn == NO) {
//        [self.view bringSubviewToFront:self.firstVC.view];
//    }if (self.isOn == YES) {
//        [self.view bringSubviewToFront:self.secondVC.view];
//    }
//    self.isOn = !self.isOn;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
