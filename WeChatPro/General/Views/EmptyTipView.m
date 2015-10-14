//
//  WSEmptyTipView.m
//  DigitalGeek
//
//  Created by lienbao on 17/08/2014.
//  Copyright (c) 2014 com.lienbao.digitalgeek. All rights reserved.
//

#import "EmptyTipView.h"
#import "AppMacro.h"
#import "UIView+Frame.h"

@interface EmptyTipView ()

@property (nonatomic, strong) UITapGestureRecognizer *singleFingerOne;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *tips;

@end

@implementation EmptyTipView

#pragma mark - getter and setter
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 270/2, 270/2)];
        _iconImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin    | UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
        _iconImageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleFingerEvent:)];
        singleFingerOne.numberOfTouchesRequired = 1; //手指
        singleFingerOne.numberOfTapsRequired = 1;    //tap次数
        [_iconImageView addGestureRecognizer:singleFingerOne];
        
        [self addSubview:_iconImageView];
    }
    return _iconImageView;
}

- (UILabel *)tips
{
    if (!_tips) {
        _tips = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
        _tips.backgroundColor = [UIColor clearColor];
        _tips.numberOfLines = 2;
        _tips.font = [UIFont systemFontOfSize:16.0f];
        _tips.textColor = [UIColor grayColor];
        _tips.textAlignment = NSTextAlignmentCenter;
        _tips.autoresizingMask = UIViewAutoresizingFlexibleTopMargin    | UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:_tips];
    }
    return _tips;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setUpEmptyView:(UIImage *)image tips:(NSString *)tips
{
    self.iconImageView.center = CGPointMake(SCREEN_WIDTH/2, self.height/2 - self.iconImageView.height/2 - self.tips.height);
    self.iconImageView.image = image;
    
    self.tips.center = CGPointMake(SCREEN_WIDTH/2, self.height/2 + self.tips.height/2);
    self.tips.text = tips;
}

#pragma mark - UITapGestureRecognizer
-(void)handleSingleFingerEvent:(UITapGestureRecognizer *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didEmptyViewCliked:)]) {
        [self.delegate didEmptyViewCliked:self];
    }
}

@end

