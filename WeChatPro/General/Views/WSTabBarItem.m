//
//  AJKRTTabBarItem.m
//  AnjukeBroker
//
//  Created by lh liu on 12-4-26.
//  Copyright (c) 2012年 anjuke. All rights reserved.
//

#import "WSTabBarItem.h"
#import "AppMacro.h"

@implementation WSTabBarItem

@synthesize rtHighlightedImage;

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self = [super initWithTitle:title image:image selectedImage:selectedImage];
    }else {
        self = [super initWithTitle:title image:image tag:1];
    }
    if (self) {
        self.rtHighlightedImage = selectedImage;
    }
    return self;
}

//自定义高亮图，如不需请隐藏该方法
- (UIImage *)selectedImage{
    return self.rtHighlightedImage;
}

- (UIImage *)unselectedImage{
    return self.image;
}

//半透白框撑满，如不需请隐藏该方法
- (UIEdgeInsets)imageInsets{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
