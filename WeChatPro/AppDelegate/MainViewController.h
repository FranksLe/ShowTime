//
//  MainViewController.h
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquareViewController.h"
#import "TabbarTwoViewController.h"
#import "TabbarThreeViewController.h"
#import "MineViewController.h"
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : 0)
#define addHeight 88

@protocol tabbarDelegate <NSObject>

-(void)touchBtnAtIndex:(NSInteger)index;

@end
@class TabbarView;
@interface MainViewController : UITabBarController<tabbarDelegate>

@property(nonatomic, strong) TabbarView *tabbar;
@property(nonatomic, strong) SquareViewController *squareVC;
@property(nonatomic, strong) TabbarTwoViewController *tabbarTwoVC;
@property(nonatomic, strong) TabbarThreeViewController *tabbarThreeVC;
@property(nonatomic, strong) MineViewController *mineVC;
@property(nonatomic, strong) NSMutableArray *array;


@end
