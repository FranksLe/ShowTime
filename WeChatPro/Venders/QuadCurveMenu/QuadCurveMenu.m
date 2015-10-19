//
//  QuadCurveMenu.m
//  AwesomeMenu
//
//  Created by Levey on 11/30/11.
//  Copyright (c) 2011 lunaapp.com. All rights reserved.
//

#import "QuadCurveMenu.h"
#import <QuartzCore/QuartzCore.h>

#define NEARRADIUS 130.0f
#define ENDRADIUS 140.0f
#define FARRADIUS 160.0f
#define STARTPOINT CGPointMake(375 / 2, 30)
//#define STARTPOINT CGPointMake(([[UIScreen mainScreen]bounds].size.width) / 2,([[UIScreen mainScreen]bounds].size.height) - 5)
#define TIMEOFFSET 0.026f

//#define WID (self.frame.size.width/375)
//#define HEI (self.frame.size.height/667)

@interface QuadCurveMenu ()
- (void)_expand;
- (void)_close;
- (CAAnimationGroup *)_blowupAnimationAtPoint:(CGPoint)p;
- (CAAnimationGroup *)_shrinkAnimationAtPoint:(CGPoint)p;
@end

@implementation QuadCurveMenu
@synthesize expanding = _expanding;
@synthesize delegate = _delegate;
@synthesize menusArray = _menusArray;

#pragma mark - initialization & cleaning up
- (id)initWithFrame:(CGRect)frame menus:(NSArray *)aMenusArray
{
    NSLog(@"frame :%f ,%f ,%f ,%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
    self = [super initWithFrame:frame];
    if (self) {
         self.signOfButtonFrame = YES;
//        if ([[UIScreen mainScreen]bounds].size.height == 480) {
//#define STARTPOINT4 CGPointMake(([[UIScreen mainScreen]bounds].size.width)/2, (([[UIScreen mainScreen]bounds].size.height) -  ([[UIScreen mainScreen]bounds].size.height/3)/2 - 50)
//
//        }else if ([[UIScreen mainScreen]bounds].size.height == 568){
//#define STARTPOINT5 CGPointMake(self.frame.size.width/2, (self.frame.size.height -  self.frame.size.height/4)/2 )
//
//        }else{
//#define STARTPOINT CGPointMake(self.frame.size.width/2, 200)
//        }
        self.backgroundColor = [UIColor clearColor];
        
        _menusArray = [aMenusArray copy];
        
        // add the menu buttons
        int count = [_menusArray count];
        int j = 0;
        for (int i = 0; i < count; i ++)
        {
//            NSLog(@"%d", count);
            QuadCurveMenuItem *item = [_menusArray objectAtIndex:i];
            item.tag = 1000 + i;
//            NSLog(@"%d", item.tag);
            
//            if ([[UIScreen mainScreen]bounds].size.height == 480) {
//                item.startPoint = STARTPOINT;
//                item.endPoint = CGPointMake((STARTPOINT4.x - ENDRADIUS * 0.8 * sinf(i * M_PI / (7 - 1))), STARTPOINT4.y + ENDRADIUS * 0.8 * cosf(i * M_PI / (7 - 1)));
//                
//                item.nearPoint = CGPointMake(STARTPOINT4.x - NEARRADIUS * sinf(i * M_PI / (7 - 1)), STARTPOINT4.y + NEARRADIUS * cosf(i * M_PI / (7 - 1)));
//                item.farPoint = CGPointMake(STARTPOINT4.x - FARRADIUS * sinf(i * M_PI / (7 - 1)), STARTPOINT4.y + FARRADIUS * cosf(i * M_PI / (7 - 1)));
//            }else if ([[UIScreen mainScreen]bounds].size.height == 568){
//                item.startPoint = STARTPOINT;
//                item.endPoint = CGPointMake((STARTPOINT5.x - ENDRADIUS * 0.8  * sinf(i * M_PI / (7 - 1))), STARTPOINT5.y + ENDRADIUS * 0.8 * cosf(i * M_PI / (7 - 1)));
//                
//                item.nearPoint = CGPointMake(STARTPOINT5.x - NEARRADIUS * sinf(i * M_PI / (7 - 1)), STARTPOINT5.y + NEARRADIUS * cosf(i * M_PI / (7 - 1)));
//                item.farPoint = CGPointMake(STARTPOINT5.x - FARRADIUS * sinf(i * M_PI / (7 - 1)), STARTPOINT5.y + FARRADIUS * cosf(i * M_PI / (7 - 1)));
//            }else{
//            
            
            item.startPoint = STARTPOINT;
            if (i == 0) {

                item.endPoint = CGPointMake((STARTPOINT.x - ENDRADIUS / 2  * -sinf(i * M_PI_2  / (count - 1))), STARTPOINT.y - ENDRADIUS  * cosf(i * M_PI_2  / (count- 1)));
                
                item.nearPoint = CGPointMake(STARTPOINT.x - NEARRADIUS / 2 * -sinf(i * M_PI_2  / (count- 1)), STARTPOINT.y - NEARRADIUS * cosf(i * M_PI_2 / (count- 1)));
            
                item.farPoint = CGPointMake(STARTPOINT.x - FARRADIUS / 2 * -sinf(i * M_PI_2  / (count- 1)), STARTPOINT.y - FARRADIUS * cosf(i * M_PI_2 / (count- 1)));
            }
            if (i == 1) {
                
                item.endPoint = CGPointMake((STARTPOINT.x - ENDRADIUS  * -sinf(2 * M_PI_4  / (count - 1))), STARTPOINT.y - ENDRADIUS  * cosf(2 * M_PI_4  / (count- 1)));
                
                item.nearPoint = CGPointMake(STARTPOINT.x - NEARRADIUS * -sinf(2 * M_PI_4  / (count- 1)), STARTPOINT.y - NEARRADIUS * cosf(2 * M_PI_4 / (count- 1)));
                
                item.farPoint = CGPointMake(STARTPOINT.x - FARRADIUS * -sinf(2 * M_PI_4  / (count- 1)), STARTPOINT.y - FARRADIUS * cosf(2 * M_PI_4 / (count- 1)));
            }
            if (i == 2) {
                
            
                item.endPoint = CGPointMake((STARTPOINT.x - ENDRADIUS  * sinf(i * M_PI_4  / (count - 1))), STARTPOINT.y - ENDRADIUS  * cosf(i * M_PI_4  / (count- 1)));
                
                item.nearPoint = CGPointMake(STARTPOINT.x - NEARRADIUS * sinf(i * M_PI_4  / (count- 1)), STARTPOINT.y - NEARRADIUS * cosf(i * M_PI_4 / (count- 1)));
                
                item.farPoint = CGPointMake(STARTPOINT.x - FARRADIUS * sinf(i * M_PI_4  / (count- 1)), STARTPOINT.y - FARRADIUS * cosf(i * M_PI_4 / (count- 1)));
            }
        
            item.center = item.startPoint;
            item.delegate = self;
            [self addSubview:item];
        }
        
//        NSString *imageName = [NSString string];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeButtonAction:) name:@"changeImageOfColl" object:nil];
//         if([[NSUserDefaults standardUserDefaults] objectForKey:@"changeImageOfCol"] == nil)
//         {
//             imageName = @"tabbar_mainbtn";
//         }else
//         {
//             imageName = [[NSUserDefaults standardUserDefaults] objectForKey:@"changeImageOfCol"];
//         }

        
        // add the "Add" Button.
        _addButton = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"centerImage"]
                                       highlightedImage:nil//[UIImage imageNamed:@"bg-addbutton-highlighted.png"]
                                           ContentImage:nil//[UIImage imageNamed:@"icon-plus.png"]
                                      highlightedContentImage:nil];//[UIImage imageNamed:@"icon-plus-highlighted.png"]];
        _addButton.delegate = self;
        _addButton.center = STARTPOINT;
        [self addSubview:_addButton];
    }
    return self;
}
//change
//-(void)changeButtonAction:(NSNotificationCenter *)notification
//{
//    _addButton.image = [UIImage imageNamed:(NSString *)[notification object]];
//}

                               
#pragma mark - UIView's methods
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    // if the menu state is expanding, everywhere can be touch
    // otherwise, only the add button are can be touch
    if (YES == _expanding) 
    {
        return YES;
    }
    else
    {
        return CGRectContainsPoint(_addButton.frame, point);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.expanding = !self.isExpanding;
}

#pragma mark - QuadCurveMenuItem delegates
- (void)quadCurveMenuItemTouchesBegan:(QuadCurveMenuItem *)item
{
    if (item == _addButton) 
    {
        self.expanding = !self.isExpanding;
    }
}
- (void)quadCurveMenuItemTouchesEnd:(QuadCurveMenuItem *)item
{
    // exclude the "add" button
    if (item == _addButton) 
    {
        return;
    }
    // blowup the selected menu button
    CAAnimationGroup *blowup = [self _blowupAnimationAtPoint:item.center];
    [item.layer addAnimation:blowup forKey:@"blowup"];
    item.center = item.startPoint;
    
    // shrink other menu buttons
    for (int i = 0; i < [_menusArray count]; i ++)
    {
        QuadCurveMenuItem *otherItem = [_menusArray objectAtIndex:i];
        CAAnimationGroup *shrink = [self _shrinkAnimationAtPoint:otherItem.center];
        if (otherItem.tag == item.tag) {
            continue;
        }
        [otherItem.layer addAnimation:shrink forKey:@"shrink"];

        otherItem.center = otherItem.startPoint;
    }
    _expanding = NO;
    
    // rotate "add" button
    float angle = self.isExpanding ? -M_PI_4 : 0.0f;
    [UIView animateWithDuration:0.2f animations:^{
        _addButton.transform = CGAffineTransformMakeRotation(angle);
    }];
    
    if ([_delegate respondsToSelector:@selector(quadCurveMenu:didSelectIndex:)])
    {
        [_delegate quadCurveMenu:self didSelectIndex:item.tag - 1000];
    }
}

#pragma mark - instant methods
- (void)setMenusArray:(NSArray *)aMenusArray
{
    if (aMenusArray == _menusArray)
    {
        return;
    }
    
    _menusArray = [aMenusArray copy];
    
    
    // clean subviews
    for (UIView *v in self.subviews) 
    {
        if (v.tag >= 1000) 
        {
            [v removeFromSuperview];
        }
    }
    // add the menu buttons
    int count = [_menusArray count];
    for (int i = 0; i < count; i ++)
    {
        QuadCurveMenuItem *item = [_menusArray objectAtIndex:i];
        item.tag = 1000 + i;
        
        
        
        
//        if ([[UIScreen mainScreen]bounds].size.height == 480) {
//            item.startPoint = STARTPOINT4;
//            item.endPoint = CGPointMake(STARTPOINT4.x + ENDRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT4.y - ENDRADIUS * cosf(i * M_PI / (count - 1)));
//            item.nearPoint = CGPointMake(STARTPOINT4.x + NEARRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT4.y - NEARRADIUS * cosf(i * M_PI / (count - 1)));
//            item.farPoint = CGPointMake(STARTPOINT4.x + FARRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT4.y - FARRADIUS * cosf(i * M_PI / (count - 1)));
//            
//        }else if ([[UIScreen mainScreen]bounds].size.height == 568){
//            item.startPoint = STARTPOINT5;
//            item.endPoint = CGPointMake(STARTPOINT5.x + ENDRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT5.y - ENDRADIUS * cosf(i * M_PI / (count - 1)));
//            item.nearPoint = CGPointMake(STARTPOINT5.x + NEARRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT5.y - NEARRADIUS * cosf(i * M_PI / (count - 1)));
//            item.farPoint = CGPointMake(STARTPOINT5.x + FARRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT5.y - FARRADIUS * cosf(i * M_PI / (count - 1)));
//        }else{
        
            
//            item.startPoint = STARTPOINT;
//            item.endPoint = CGPointMake(STARTPOINT.x + ENDRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT.y - ENDRADIUS * cosf(i * M_PI / (count - 1)));
//            item.nearPoint = CGPointMake(STARTPOINT.x + NEARRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT.y - NEARRADIUS * cosf(i * M_PI / (count - 1)));
//            item.farPoint = CGPointMake(STARTPOINT.x + FARRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT.y - FARRADIUS * cosf(i * M_PI / (count - 1)));
//        }

        item.startPoint = STARTPOINT;
        item.endPoint = CGPointMake(STARTPOINT.x + ENDRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT.y - ENDRADIUS * cosf(i * M_PI / (count - 1)));
        item.nearPoint = CGPointMake(STARTPOINT.x + NEARRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT.y - NEARRADIUS * cosf(i * M_PI / (count - 1)));
        item.farPoint = CGPointMake(STARTPOINT.x + FARRADIUS * sinf(i * M_PI / (count - 1)), STARTPOINT.y - FARRADIUS * cosf(i * M_PI / (count - 1)));
        
        
 

        item.center = item.startPoint;
        item.delegate = self;
        [self addSubview:item];
    }
}
- (BOOL)isExpanding
{
    return _expanding;
}

- (void)setExpanding:(BOOL)expanding
{
//    NSLog(@"11");
    _expanding = expanding;
    
    NSLog(@"click");
    if (self.signOfButtonFrame) {
    
//    _addButton.frame = CGRectMake(_addButton.frame.origin.x, _addButton.frame.origin.y - 150, _addButton.frame.size.width, _addButton.frame.size.height);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeFrame" object:@"f"];
    }else
    {
//    _addButton.frame = CGRectMake(_addButton.frame.origin.x, _addButton.frame.origin.y + 150, _addButton.frame.size.width, _addButton.frame.size.height);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeFrame1" object:@"f"];
    }
    self.signOfButtonFrame = !self.signOfButtonFrame;
    NSLog(@"button sign %d",self.signOfButtonFrame);
    
    // rotate add button
    float angle = self.isExpanding ? -M_PI_4 : 0.0f;
    [UIView animateWithDuration:0.2f animations:^{
        _addButton.transform = CGAffineTransformMakeRotation(angle);
    }];
    
    // expand or close animation
    if (!_timer) 
    {
        _flag = self.isExpanding ? 0 : _menusArray.count - 1;
        SEL selector = self.isExpanding ? @selector(_expand) : @selector(_close);
        _timer = [NSTimer scheduledTimerWithTimeInterval:TIMEOFFSET target:self selector:selector userInfo:nil repeats:YES] ;
    }
}
#pragma mark - private methods
- (void)_expand
{
    
//    NSLog(@"22");

    CGRect frame = CGRectMake(0, 475, 375, 210);
    
    
    if (_flag == _menusArray.count)
    {
        [_timer invalidate];
        _timer = nil;
        return;
    }
    
    int tag = 1000 + _flag;
    QuadCurveMenuItem *item = (QuadCurveMenuItem *)[self viewWithTag:tag];
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:M_PI],[NSNumber numberWithFloat:0.0f], nil];
    rotateAnimation.duration = 0.5f;
    rotateAnimation.keyTimes = [NSArray arrayWithObjects:
                                [NSNumber numberWithFloat:.3], 
                                [NSNumber numberWithFloat:.4], nil]; 
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration = 0.5f;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, item.startPoint.x, item.startPoint.y);
    CGPathAddLineToPoint(path, NULL, item.farPoint.x, item.farPoint.y);
    CGPathAddLineToPoint(path, NULL, item.nearPoint.x, item.nearPoint.y); 
    CGPathAddLineToPoint(path, NULL, item.endPoint.x, item.endPoint.y); 
    positionAnimation.path = path;
    CGPathRelease(path);
    
    CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
    animationgroup.animations = [NSArray arrayWithObjects:positionAnimation, rotateAnimation, nil];
    animationgroup.duration = 0.5f;
    animationgroup.fillMode = kCAFillModeForwards;
    animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [item.layer addAnimation:animationgroup forKey:@"Expand"];
    item.center = item.endPoint;
    
    _flag ++;
    
}

- (void)_close
{
    
//    NSLog(@"333");
    if (_flag == -1)
    {
        [_timer invalidate];
        _timer = nil;
        return;
    }
    
    int tag = 1000 + _flag;
     QuadCurveMenuItem *item = (QuadCurveMenuItem *)[self viewWithTag:tag];
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:M_PI * 2],[NSNumber numberWithFloat:0.0f], nil];
    rotateAnimation.duration = 0.5f;
    rotateAnimation.keyTimes = [NSArray arrayWithObjects:
                                [NSNumber numberWithFloat:.0], 
                                [NSNumber numberWithFloat:.4],
                                [NSNumber numberWithFloat:.5], nil]; 
        
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration = 0.5f;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, item.endPoint.x, item.endPoint.y);
    CGPathAddLineToPoint(path, NULL, item.farPoint.x, item.farPoint.y);
    CGPathAddLineToPoint(path, NULL, item.startPoint.x, item.startPoint.y); 
    positionAnimation.path = path;
    CGPathRelease(path);
    
    CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
    animationgroup.animations = [NSArray arrayWithObjects:positionAnimation, rotateAnimation, nil];
    animationgroup.duration = 0.5f;
    animationgroup.fillMode = kCAFillModeForwards;
    animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [item.layer addAnimation:animationgroup forKey:@"Close"];
    item.center = item.startPoint;
    _flag --;
}

- (CAAnimationGroup *)_blowupAnimationAtPoint:(CGPoint)p
{
    
    NSLog(@"44");
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.values = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:p], nil];
    positionAnimation.keyTimes = [NSArray arrayWithObjects: [NSNumber numberWithFloat:.3], nil]; 
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(3, 3, 1)];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.toValue  = [NSNumber numberWithFloat:0.0f];
    
    CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
    animationgroup.animations = [NSArray arrayWithObjects:positionAnimation, scaleAnimation, opacityAnimation, nil];
    animationgroup.duration = 0.3f;
    animationgroup.fillMode = kCAFillModeForwards;

    return animationgroup;
}

- (CAAnimationGroup *)_shrinkAnimationAtPoint:(CGPoint)p
{
    
    NSLog(@"55");
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.values = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:p], nil];
    positionAnimation.keyTimes = [NSArray arrayWithObjects: [NSNumber numberWithFloat:.3], nil]; 
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(.01, .01, 1)];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.toValue  = [NSNumber numberWithFloat:0.0f];
    
    CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
    animationgroup.animations = [NSArray arrayWithObjects:positionAnimation, scaleAnimation, opacityAnimation, nil];
    animationgroup.duration = 0.3f;
    animationgroup.fillMode = kCAFillModeForwards;
    
    return animationgroup;
}


@end
