//
//  AJKRTTabBarItem.h
//  AnjukeBroker
//
//  Created by lh liu on 12-4-26.
//  Copyright (c) 2012年 anjuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSTabBarItem : UITabBarItem

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

@property(nonatomic,strong) UIImage *rtHighlightedImage;

@end
