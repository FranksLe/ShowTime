//
//  WSBaseViewController.h
//  DigitalGeek
//
//  Created by lienbao on 19/08/2014.
//  Copyright (c) 2014 com.lienbao.digitalgeek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmptyTipView.h"
#import "UIView+Frame.h"
#import "AppMacro.h"
#import "UIColor+Additions.h"
#import "UIImage+Additions.h"

@interface BaseViewController : UIViewController

@property (nonatomic, readonly) EmptyTipView *emptyView;

- (BOOL)checkNetwork;

//tips
- (void)showEmptyView;
- (void)showErrorView;
- (void)hiddenEmptyOrErrorView;
- (void)showEmptyWithIcon:(UIImage *)icon tips:(NSString *)tips;

- (void)showActivityIndicator;
- (void)showLoadingWithAnimation;
- (void)hiddenLoadingOrActivity;

- (void)showMessage:(NSString *)message;
- (void)showMessage:(NSString *)message duration:(CGFloat)duration;

//nav
- (UIButton *)leftBarButtonItem;
- (void)setNavLeftBarButtonItemCustom:(UIView *)customView;
- (void)setNavLeftBarButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)setNavRightBarButtonItemCustom:(UIView *)customView;
- (void)setNavRightBarButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)backButtonClick:(id)sender;

@end
