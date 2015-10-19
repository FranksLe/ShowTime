//
//  TabbarView.m
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/18.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "TabbarView.h"

@implementation TabbarView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:frame];
        [self layoutView];
    }
    return self;
}

-(void)layoutView
{
    _tabbarBackGroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbarBacground"]];
    [_tabbarBackGroundView setFrame:CGRectMake(0, 9, [UIScreen mainScreen].bounds.size.width, 51)];
    [_tabbarBackGroundView setUserInteractionEnabled:YES];
    
    // 改变tabbarview的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFrame) name:@"changeFrame" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeNewFrame) name:@"changeFrame1" object:nil];
    
    UIImage *centerImage = [UIImage imageNamed:@"centerImage"];
    UIImage *centerImage1 = [UIImage imageNamed:@"centerImage"];
    // 设置弹出按钮
    QuadCurveMenuItem *carmeraMenuItem = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"cameraImage"] highlightedImage:[UIImage imageNamed:@"cameraImage"] ContentImage:[UIImage imageNamed:@"cameraImage"] highlightedContentImage:nil];
    QuadCurveMenuItem *viodeMenuItem = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"newFuctionImage"] highlightedImage:[UIImage imageNamed:@"newFuctionImage"] ContentImage:[UIImage imageNamed:@"newFuctionImage"] highlightedContentImage:nil];
    QuadCurveMenuItem *photoMenuItem = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"noteFunctionImage"] highlightedImage:[UIImage imageNamed:@"noteFunctionImage"] ContentImage:[UIImage imageNamed:@"noteFunctionImage"] highlightedContentImage:nil];
    NSArray *menus = [NSArray arrayWithObjects:carmeraMenuItem, viodeMenuItem, photoMenuItem, nil];
    self.menu = [[QuadCurveMenu alloc] initWithFrame:CGRectMake(0, 5, self.frame.size.width, self.frame.size.height) menus:menus];
    self.menu.delegate = self;
    [self layOutBtn];
    [self addSubview:_tabbarBackGroundView];
    [self addSubview:self.menu];
}

-(void)layOutBtn
{
    _tabbarOneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_tabbarOneButton setFrame:CGRectMake(25, 15, 25, 30)];
    [_tabbarOneButton setTag:101];
    UIImage *tabbarOneImage = [UIImage imageNamed:@"tabbarButton1Selected"];
    tabbarOneImage = [tabbarOneImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_tabbarOneButton setBackgroundImage:tabbarOneImage forState:UIControlStateNormal];
    [_tabbarOneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _tabbarTwoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_tabbarTwoButton setFrame:CGRectMake(self.frame.size.width / 5 + 25, 15, 25, 30)];
    [_tabbarTwoButton setTag:102];
    [_tabbarTwoButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton2"] forState:UIControlStateNormal];
    [_tabbarTwoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _tabbarThreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_tabbarThreeButton setFrame:CGRectMake(self.frame.size.width - 2 * self.frame.size.width / 5 + 25, 15, 25, 30)];
    [_tabbarThreeButton setTag:103];
    [_tabbarThreeButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton3"] forState:UIControlStateNormal];
    [_tabbarThreeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _tabbarFourButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_tabbarFourButton setFrame:CGRectMake(self.frame.size.width - self.frame.size.width / 5 + 25, 15, 25, 30)];
    [_tabbarFourButton setTag:104];
    [_tabbarFourButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton4"] forState:UIControlStateNormal];
    [_tabbarFourButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_tabbarBackGroundView addSubview:_tabbarOneButton];
    [_tabbarBackGroundView addSubview:_tabbarTwoButton];
    [_tabbarBackGroundView addSubview:_tabbarThreeButton];
    [_tabbarBackGroundView addSubview:_tabbarFourButton];
    
}

-(void)changeFrame
{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y - 150, self.frame.size.width, self.frame.size.height + 150)];
    self.backgroundColor = [UIColor clearColor];
    self.tabbarBackGroundView.frame = CGRectMake(0, 9 + 150, self.tabbarBackGroundView.frame.size.width, self.tabbarBackGroundView.frame.size.height);
    CGRect upFrame = CGRectMake(self.menu.frame.origin.x, self.menu.frame.origin.y + 150, self.menu.frame.size.width, self.menu.frame.size.height);
    self.menu.frame = upFrame;
}

-(void)changeNewFrame
{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + 150, self.frame.size.width, self.frame.size.height - 150)];
    self.backgroundColor = [UIColor clearColor];
    self.tabbarBackGroundView.frame = CGRectMake(0, 9, self.tabbarBackGroundView.frame.size.width, self.tabbarBackGroundView.frame.size.height);
    CGRect upFrame = CGRectMake(self.menu.frame.origin.x, self.menu.frame.origin.y - 150, self.menu.frame.size.width, self.menu.frame.size.height);
    self.menu.frame = upFrame;
}

-(void)buttonClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    switch (btn.tag) {
        case 101:
        {
            [_tabbarOneButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton1Selected"] forState:UIControlStateNormal];
            [_tabbarTwoButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton2"] forState:UIControlStateNormal];
            [_tabbarThreeButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton3"] forState:UIControlStateNormal];
            [_tabbarFourButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton4"] forState:UIControlStateNormal];
            [self.delegate touchBtnAtIndex:0];
             break;
        }
        case 102:{
            [_tabbarOneButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton1"] forState:UIControlStateNormal];
            [_tabbarTwoButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton2Selected"] forState:UIControlStateNormal];
            [_tabbarThreeButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton3"] forState:UIControlStateNormal];
            [_tabbarFourButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton4"] forState:UIControlStateNormal];
            [self.delegate touchBtnAtIndex:1];
             break;
        }
        case 103:{
            [_tabbarOneButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton1"] forState:UIControlStateNormal];
            [_tabbarTwoButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton2"] forState:UIControlStateNormal];
            [_tabbarThreeButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton3Selected"] forState:UIControlStateNormal];
            [_tabbarFourButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton4"] forState:UIControlStateNormal];
            [self.delegate touchBtnAtIndex:2];
             break;
        }
        case 104:{
            [_tabbarOneButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton1"] forState:UIControlStateNormal];
            [_tabbarTwoButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton2"] forState:UIControlStateNormal];
            [_tabbarThreeButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton3"] forState:UIControlStateNormal];
            [_tabbarFourButton setBackgroundImage:[UIImage imageNamed:@"tabbarButton4Selected"] forState:UIControlStateNormal];
            [self.delegate touchBtnAtIndex:3];
            break;
        }
        default:
            break;
    }
}

-(void)quadCurveMenu:(QuadCurveMenu *)menu didSelectIndex:(NSInteger)idx
{
    [self changeNewFrame];
    NSLog(@"cklick center");
    if (idx == 0) {
        
    }if (idx == 1) {
        
    }
    self.menu.signOfButtonFrame = !self.menu.signOfButtonFrame;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
