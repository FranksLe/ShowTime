//
//  UISearchBar+removeBackgroundView.m
//  AnjukeHD
//
//  Created by casa on 13-10-22.
//  Copyright (c) 2013年 anjuke. All rights reserved.
//

#import "UISearchBar+removeBackgroundView.h"

@implementation UISearchBar (removeBackgroundView)

- (void)removeBackgroundViewWithSubViews:(NSArray *)subviewArray
{
    for (UIView *subview in subviewArray) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subview removeFromSuperview];
            return;
        }
        if (subview.subviews.count > 0) {
            [self removeBackgroundViewWithSubViews:subview.subviews];
        }
    }
}

- (void)setCustomBackgroundImage:(UIImage *)image
{
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarPosition:barMetrics:)]) {
        [self setBackgroundImage:image forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    }else {
        [self setBackgroundImage:image];
    }
}

- (void)setCustomSearchFieldBackgroundImage:(UIImage *)image
{
    UITextField *searchField = nil;
    NSUInteger subViewsCount = [self.subviews count];
    for(int i = 0; i < subViewsCount; i++) {
        if([[self.subviews objectAtIndex:i] isKindOfClass:[UITextField class]]) {
            searchField = [self.subviews objectAtIndex:i];
        }
    }
    
    if(nil != searchField) {
        [searchField setBorderStyle:UITextBorderStyleNone];
        [searchField setBackground:image];
    }
}

@end
