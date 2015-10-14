//
//  Material.m
//  Artist
//
//  Created by lienbao on 15/4/20.
//  Copyright (c) 2015年 lienbao. All rights reserved.
//

#import "Material.h"
#import <QuartzCore/QuartzCore.h>

#define kSPUserResizableViewGlobalInset 5.0
#define kSPUserResizableViewDefaultMinWidth 48.0
#define kSPUserResizableViewInteractiveBorderSize 10.0
#define kZDStickerViewControlSize 36.0

@interface Material ()

@property (strong, nonatomic) UIImageView *resizingControl;
@property (strong, nonatomic) UIImageView *deleteControl;

@property (nonatomic) BOOL preventsLayoutWhileResizing;

@property (nonatomic) CGFloat deltaAngle;
@property (nonatomic) CGPoint prevPoint;
@property (nonatomic) CGPoint touchStart;
@property (nonatomic) CGAffineTransform startTransform;

@end

@implementation Material

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self setupDefaultAttributes];
    }
    return self;
}

- (instancetype)initWithContentView:(UIView *)contentView
{
    self = [self initWithFrame:contentView.frame];
    if (self) {
        [self setContentView:contentView];
    }
    return self;
}

- (void)setBackgroundImage:(UIImage *)image
{
    self.image = image;
}

- (void)hideEditing
{
    _resizingControl.hidden = YES;
    _deleteControl.hidden = YES;
}

- (void)showEditing
{
    _resizingControl.hidden = NO;
    _deleteControl.hidden = NO;
}

- (void)setContentView:(UIView *)newContentView
{
    [_contentView removeFromSuperview];
    _contentView = newContentView;
    _contentView.frame = CGRectInset(self.bounds,
                                     kSPUserResizableViewGlobalInset + kSPUserResizableViewInteractiveBorderSize/2,
                                     kSPUserResizableViewGlobalInset + kSPUserResizableViewInteractiveBorderSize/2);
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:_contentView];
    
    [self bringSubviewToFront:_resizingControl];
    [self bringSubviewToFront:_deleteControl];
}

- (void)setFrame:(CGRect)newFrame
{
    [super setFrame:newFrame];
    _contentView.frame = CGRectInset(self.bounds,
                                     kSPUserResizableViewGlobalInset + kSPUserResizableViewInteractiveBorderSize/2,
                                     kSPUserResizableViewGlobalInset + kSPUserResizableViewInteractiveBorderSize/2);
    
    _resizingControl.frame =CGRectMake(self.bounds.size.width  - kZDStickerViewControlSize,
                                       self.bounds.size.height - kZDStickerViewControlSize,
                                       kZDStickerViewControlSize,
                                       kZDStickerViewControlSize);
    _deleteControl.frame = CGRectMake(0,
                                      0,
                                      kZDStickerViewControlSize,
                                      kZDStickerViewControlSize);
}

-(void)singleTap:(UIPanGestureRecognizer *)recognizer
{
    if (NO == self.preventsDeleting) {
        UIView * close = (UIView *)[recognizer view];
        [close.superview removeFromSuperview];
    }
    
    if([_delegate respondsToSelector:@selector(materialViewDidClose:)]) {
        [_delegate materialViewDidClose:self];
    }
}

-(void)resizeTranslate:(UIPanGestureRecognizer *)recognizer
{
    if ([recognizer state]== UIGestureRecognizerStateBegan)
    {
        _prevPoint = [recognizer locationInView:self];
        [self setNeedsDisplay];
    }
    else if ([recognizer state] == UIGestureRecognizerStateChanged)
    {
        if (self.bounds.size.width < _minWidth || self.bounds.size.width < _minHeight)
        {
            self.bounds = CGRectMake(self.bounds.origin.x,
                                     self.bounds.origin.y,
                                     _minWidth,
                                     _minHeight);
            
            _resizingControl.frame =CGRectMake(self.bounds.size.width-kZDStickerViewControlSize,
                                              self.bounds.size.height-kZDStickerViewControlSize,
                                              kZDStickerViewControlSize,
                                              kZDStickerViewControlSize);
            _deleteControl.frame = CGRectMake(0, 0,
                                             kZDStickerViewControlSize, kZDStickerViewControlSize);
            _prevPoint = [recognizer locationInView:self];
            
        } else {
            CGPoint point = [recognizer locationInView:self];
            float wChange = 0.0, hChange = 0.0;
            
            wChange = (point.x - _prevPoint.x);
            hChange = (point.y - _prevPoint.y);
            
            if (ABS(wChange) > 20.0f || ABS(hChange) > 20.0f) {
                _prevPoint = [recognizer locationInView:self];
                return;
            }
            
            if (YES == self.preventsLayoutWhileResizing) {
                if (wChange < 0.0f && hChange < 0.0f) {
                    float change = MIN(wChange, hChange);
                    wChange = change;
                    hChange = change;
                }
                if (wChange < 0.0f) {
                    hChange = wChange;
                } else if (hChange < 0.0f) {
                    wChange = hChange;
                } else {
                    float change = MAX(wChange, hChange);
                    wChange = change;
                    hChange = change;
                }
            }
            
            self.bounds = CGRectMake(self.bounds.origin.x,
                                     self.bounds.origin.y,
                                     self.bounds.size.width + (wChange),
                                     self.bounds.size.height + (hChange));
            
            _resizingControl.frame =CGRectMake(self.bounds.size.width-kZDStickerViewControlSize,
                                              self.bounds.size.height-kZDStickerViewControlSize,
                                              kZDStickerViewControlSize, kZDStickerViewControlSize);
            _deleteControl.frame = CGRectMake(0, 0,
                                             kZDStickerViewControlSize, kZDStickerViewControlSize);
            _prevPoint = [recognizer locationInView:self];
        }
        
        /* Rotation */
        CGFloat ang = atan2([recognizer locationInView:self.superview].y - self.center.y,
                          [recognizer locationInView:self.superview].x - self.center.x);
        CGFloat angleDiff = _deltaAngle - ang;
        if (NO == _preventsResizing) {
            self.transform = CGAffineTransformMakeRotation(-angleDiff);
        }
        [self setNeedsDisplay];
    }
    else if ([recognizer state] == UIGestureRecognizerStateEnded)
    {
        _prevPoint = [recognizer locationInView:self];
        [self setNeedsDisplay];
    }
}

- (void)setupDefaultAttributes {
    
    if (kSPUserResizableViewDefaultMinWidth > self.bounds.size.width*0.5) {
        self.minWidth = kSPUserResizableViewDefaultMinWidth;
        self.minHeight = self.bounds.size.height * (kSPUserResizableViewDefaultMinWidth/self.bounds.size.width);
    } else {
        self.minWidth = self.bounds.size.width*0.5;
        self.minHeight = self.bounds.size.height*0.5;
    }
    
    self.preventsPositionOutsideSuperview = YES;
    self.preventsLayoutWhileResizing = YES;
    self.preventsResizing = NO;
    self.preventsDeleting = NO;
    
    _deleteControl = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,
                                                                 kZDStickerViewControlSize, kZDStickerViewControlSize)];
    _deleteControl.backgroundColor = [UIColor clearColor];
    _deleteControl.image = [UIImage imageNamed:@"template_close" ];
    _deleteControl.userInteractionEnabled = YES;
    UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(singleTap:)];
    [_deleteControl addGestureRecognizer:singleTap];
    [self addSubview:_deleteControl];
    
    _resizingControl = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-kZDStickerViewControlSize,
                                                                   self.frame.size.height-kZDStickerViewControlSize,
                                                                   kZDStickerViewControlSize, kZDStickerViewControlSize)];
    _resizingControl.backgroundColor = [UIColor clearColor];
    _resizingControl.userInteractionEnabled = YES;
    _resizingControl.image = [UIImage imageNamed:@"ZDBtn2.png" ];
    UIPanGestureRecognizer* panResizeGesture = [[UIPanGestureRecognizer alloc]
                                                initWithTarget:self
                                                action:@selector(resizeTranslate:)];
    [_resizingControl addGestureRecognizer:panResizeGesture];
    [self addSubview:_resizingControl];
    _deltaAngle = atan2(self.frame.origin.y+self.frame.size.height - self.center.y,
                       self.frame.origin.x+self.frame.size.width - self.center.x);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _touchStart = [touch locationInView:self.superview];
    if([_delegate respondsToSelector:@selector(materialViewDidBeginEditing:)]) {
        [_delegate materialViewDidBeginEditing:self];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // Notify the delegate we've ended our editing session.
    if([_delegate respondsToSelector:@selector(materialViewDidEndEditing:)]) {
        [_delegate materialViewDidEndEditing:self];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Notify the delegate we've ended our editing session.
    if([_delegate respondsToSelector:@selector(materialViewDidCancelEditing:)]) {
        [_delegate materialViewDidCancelEditing:self];
    }
}

- (void)translateUsingTouchLocation:(CGPoint)touchPoint
{
    CGPoint newCenter = CGPointMake(self.center.x + touchPoint.x - _touchStart.x,
                                    self.center.y + touchPoint.y - _touchStart.y);
    if (self.preventsPositionOutsideSuperview) {
        // Ensure the translation won't cause the view to move offscreen.
        CGFloat midPointX = CGRectGetMidX(self.bounds);
        if (newCenter.x > self.superview.bounds.size.width - midPointX) {
            newCenter.x = self.superview.bounds.size.width - midPointX;
        }
        if (newCenter.x < midPointX) {
            newCenter.x = midPointX;
        }
        CGFloat midPointY = CGRectGetMidY(self.bounds);
        if (newCenter.y > self.superview.bounds.size.height - midPointY) {
            newCenter.y = self.superview.bounds.size.height - midPointY;
        }
        if (newCenter.y < midPointY) {
            newCenter.y = midPointY;
        }
    }
    self.center = newCenter;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touch = [[touches anyObject] locationInView:self.superview];
    [self translateUsingTouchLocation:touch];
    _touchStart = touch;
}

@end
