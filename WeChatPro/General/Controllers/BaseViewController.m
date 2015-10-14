//
//  B5MViewController.m
//  B5M
//
//  Created by lienbao on 01/09/2014.
//  Copyright (c) 2014 b5m. All rights reserved.
//

#import "BaseViewController.h"
#import "SVProgressHUD.h"

@interface BaseViewController () <EmptyTipViewDelegate>

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) UILabel *loadingTips;
@property (nonatomic, strong) EmptyTipView *emptyView;

@end

@implementation BaseViewController

#pragma mark - getter and setter
- (UIActivityIndicatorView *)activityIndicatorView
{
    if (nil == _activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicatorView.frame = CGRectMake(0, 0, 60, 60);
        _activityIndicatorView.hidesWhenStopped = YES;
        _activityIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin    | UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin ;
    }
    return _activityIndicatorView;
}

- (UILabel *)loadingTips
{
    if (nil == _loadingTips) {
        _loadingTips = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 60)];
        _loadingTips.backgroundColor = [UIColor clearColor];
        _loadingTips.font = [UIFont systemFontOfSize:18.0f];
        _loadingTips.textColor = [UIColor grayColor];
        _loadingTips.textAlignment = NSTextAlignmentRight;
        _loadingTips.text = @"努力加载中...";
        _loadingTips.autoresizingMask = UIViewAutoresizingFlexibleTopMargin    | UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin ;
        [_loadingTips addSubview:self.activityIndicatorView];
    }
    return _loadingTips;
}

- (EmptyTipView *)emptyView
{
    if (!_emptyView) {
        _emptyView = [[EmptyTipView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.width)];
        _emptyView.backgroundColor = [UIColor clearColor];
        _emptyView.center = self.view.center;
        _emptyView.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin |
        UIViewAutoresizingFlexibleRightMargin;
        _emptyView.delegate = self;
    }
    return _emptyView;
}

- (UIButton *)leftBarButtonItem
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 88/2, 44);
    [leftButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
//    [leftButton setTitleColor:[UIColor colorWithRGBHex:0x586576] forState:UIControlStateNormal];
    return leftButton;
}

#pragma mark - life circle
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame = [self.view mainFrame];
    self.view.backgroundColor = [UIColor colorWithHex:0xF3F2F2 alpha:1.0f];
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    if (self.navigationController.viewControllers.count > 1) {
        [self setNavLeftBarButtonItemCustom:[self leftBarButtonItem]];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self hiddenLoadingOrActivity];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) checkNetwork
{
    return YES;
}

- (void)showEmptyView
{
    [self showEmptyWithIcon:[UIImage imageNamed:@"browsed_histroy_icon"] tips:@"暂无数据"];
}

- (void)showErrorView
{
    [self showEmptyWithIcon:[UIImage imageNamed:@"bg_rotNetwork"] tips:@"暂无网络"];
}

- (void)showEmptyWithIcon:(UIImage *)icon tips:(NSString *)tips
{
    [self.emptyView setUpEmptyView:icon tips:tips];
    if (![self.emptyView superview]) {
        [self.view addSubview:self.emptyView];
    }
}

- (void)hiddenEmptyOrErrorView
{
    [self.emptyView removeFromSuperview];
}

- (void)showActivityIndicator
{
    if (![self.loadingTips superview]) {
        self.loadingTips.center = self.view.center;
        [self.view addSubview:self.loadingTips];
    }
    [self.activityIndicatorView startAnimating];
}

- (void)hiddenActivityIndicator
{
    [self.activityIndicatorView stopAnimating];
    if ([self.loadingTips superview]) {
        [self.loadingTips removeFromSuperview];
    }
}

- (void)showLoadingWithAnimation
{
    [SVProgressHUD showWithStatus:@"加载中......" maskType:SVProgressHUDMaskTypeNone];
}

- (void)hiddenLoadingOrActivity
{
    [SVProgressHUD dismiss];
    [self hiddenActivityIndicator];
}

- (void)showMessage:(NSString *)message
{
    [self showMessage:message duration:1.0f];
}

- (void)showMessage:(NSString *)message duration:(CGFloat)duration
{
    [SVProgressHUD showInfoWithStatus:message maskType:SVProgressHUDMaskTypeBlack];
}

- (void)setNavLeftBarButtonItemCustom:(UIView *)customView
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    [self setNavLeftBarButtonItem:barButtonItem];
}

- (void)setNavLeftBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSArray* barButtons = nil;
    barButtons = [NSArray arrayWithObjects: barButtonItem,nil ];
    [self.navigationItem setLeftBarButtonItems:barButtons];
}

- (void)setNavRightBarButtonItemCustom:(UIView *)customView
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    [self setNavRightBarButtonItem:barButtonItem];
}

- (void)setNavRightBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [self.navigationItem setRightBarButtonItem:barButtonItem];
    return;
    
    NSArray* barButtons = nil;
    barButtons = [NSArray arrayWithObjects: barButtonItem,nil ];
    [self.navigationItem setRightBarButtonItems:barButtons];
}

- (void)backButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - WSEmptyTipViewDelegate
- (void)didEmptyViewCliked:(EmptyTipView *)emptyView
{
    
}

@end
