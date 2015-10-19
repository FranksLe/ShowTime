//
//  MainViewController.m
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "MainViewController.h"
#import "WSTabBarItem.h"
#import "AppMacro.h"
#import "ColorMacro.h"
#import "UIImage+Additions.h"
#import "TabbarView.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat orginHeight = self.view.frame.size.height - 60;
    if (iPhone5) {
        orginHeight = self.view.frame.size.height - 60 + addHeight;
    }
    
    _tabbar = [[TabbarView alloc] initWithFrame:CGRectMake(0, orginHeight, [[UIScreen mainScreen] bounds].size.width, 60)];
    _tabbar.delegate = self;
    [self.view addSubview:_tabbar];
    
    self.squareVC = [[SquareViewController alloc] init];
    self.tabbarTwoVC = [[TabbarTwoViewController alloc] init];
    self.tabbarThreeVC = [[TabbarThreeViewController alloc] init];
    self.mineVC = [[MineViewController alloc] init];
    
    [self addChildViewController:self.squareVC];
    [self addChildViewController:self.tabbarTwoVC];
    [self addChildViewController:self.tabbarThreeVC];
    [self addChildViewController:self.mineVC];
    
    [self.view insertSubview:self.squareVC.view belowSubview:_tabbar];
    self.navigationItem.title = @"广场";
    
    // Do any additional setup after loading the view.
}

-(void)touchBtnAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            [self.view insertSubview:self.squareVC.view belowSubview:_tabbar];
            self.navigationItem.title = @"广场";
            break;
        }
        case 1:{
            [self.view insertSubview:self.tabbarTwoVC.view belowSubview:_tabbar];
            self.navigationItem.title = @"第二页";
            break;
        }
        case 2:{
            [self.view insertSubview:self.tabbarThreeVC.view belowSubview:_tabbar];
            self.navigationItem.title = @"第三页";
            break;
        }
        case 3:{
            [self.view insertSubview:self.mineVC.view belowSubview:_tabbar];
            self.navigationItem.title = @"我的";
            break;
        }
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
