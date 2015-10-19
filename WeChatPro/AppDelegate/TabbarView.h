//
//  TabbarView.h
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/18.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "QuadCurveMenu.h"
#import "QuadCurveMenuItem.h"

@interface TabbarView : UIView<QuadCurveMenuDelegate, QuadCurveMenuItemDelegate>

@property(nonatomic, strong) UIImageView *tabbarBackGroundView;
@property(nonatomic, strong) UIImageView *tabbarViewCenter;
@property(nonatomic, strong) UIButton *tabbarOneButton;
@property(nonatomic, strong) UIButton *tabbarTwoButton;
@property(nonatomic, strong) UIButton *tabbarThreeButton;
@property(nonatomic, strong) UIButton *tabbarFourButton;
@property(nonatomic, strong) QuadCurveMenu *menu;
@property(nonatomic, strong) id<tabbarDelegate> delegate;
@property(nonatomic, assign) BOOL isOn;
@end
