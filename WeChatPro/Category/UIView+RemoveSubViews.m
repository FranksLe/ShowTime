//
//  UIView+RemoveSubViews.m
//  UIComponents
//
//  Created by yan zheng on 13-4-1.
//  Copyright (c) 2013年 anjuke inc. All rights reserved.
//

#import "UIView+RemoveSubViews.h"

@implementation UIView (RemoveSubViews)

- (void)removeAllSubviews {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

@end
