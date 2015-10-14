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
@interface MainViewController ()<UITabBarControllerDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewControllers];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViewControllers
{
    //配置back btn
    if ( SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0") ) {
        [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
        [self.tabBar setTintColor:[UIColor whiteColor]];
        [self.tabBar setTranslucent:NO];
    }
    
    [self.tabBar setBackgroundImage:[UIImage blackColorImage]];
    [self.tabBar setSelectionIndicatorImage:[UIImage blackColorImage]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName :[UIColor redColor],
                                                         NSFontAttributeName:[UIFont systemFontOfSize:12.0]}
                                             forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName :[UIColor grayColor],
                                                         NSFontAttributeName:[UIFont systemFontOfSize:12.0]}
                                             forState:UIControlStateNormal];
    
    NSDictionary *params = @{ NSForegroundColorAttributeName:[UIColor whiteColor],
                              NSFontAttributeName:[UIFont systemFontOfSize:16.0],
                              //NSShadowAttributeName:[NSShadow ] [NSValue valueWithUIOffset:UIOffsetMake(0, 0)]
                              };
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:params
                                                forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setTitleTextAttributes:params];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage resizableImageWithColor:colorNavigationBar] forBarMetrics:UIBarMetricsDefault];
    UIImage *squareImage = [UIImage imageNamed:@"imagered"];
    squareImage = [squareImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    WSTabBarItem *homeTabBarItem       = [[WSTabBarItem alloc] initWithTitle:@"商品"
                                                                       image:squareImage
                                                               selectedImage:squareImage];
    WSTabBarItem *categoryTabBarItem   = [[WSTabBarItem alloc] initWithTitle:@"圈子"
                                                                       image:squareImage
                                                               selectedImage:squareImage];
    WSTabBarItem *messageTabBarItem    = [[WSTabBarItem alloc] initWithTitle:@"发现"
                                                                       image:squareImage
                                                               selectedImage:squareImage];
    WSTabBarItem *meTabBarItem         = [[WSTabBarItem alloc] initWithTitle:@"我"
                                                                       image:squareImage
                                                               selectedImage:squareImage];
    
    self.viewControllers = @[ [self viewController:@"ProductViewController"      tabBarItem:homeTabBarItem],
                              [self viewController:@"SquareViewController"       tabBarItem:categoryTabBarItem],
                              [self viewController:@"FoundViewController"  tabBarItem:messageTabBarItem],
                              [self viewController:@"MineViewController"  tabBarItem:meTabBarItem]];
    
    
    self.delegate = self;
    
    [self setSelectedIndex:0];
}

- (UIViewController *)viewController:(NSString *)className tabBarItem:(WSTabBarItem *)tabBarItem
{
    Class class = NSClassFromString(className);
    UIViewController *viewController = [[class alloc] init];
    viewController.navigationController.navigationBar.translucent = NO;
    viewController.tabBarItem = tabBarItem;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.navigationBar.translucent = NO;
    return navigationController;
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
       return YES;
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
