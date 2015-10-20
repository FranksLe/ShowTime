//
//  SquareViewController.h
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/17.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquareFirstViewController.h"
#import "SquareSecondViewController.h"

@interface SquareViewController : UIViewController
@property(nonatomic,assign) BOOL isOn;
@property(nonatomic, strong) SquareFirstViewController *firstVC;
@property(nonatomic, strong) SquareSecondViewController *secondVC;

@end
