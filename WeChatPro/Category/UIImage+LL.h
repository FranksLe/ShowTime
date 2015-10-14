//
//  UIImage+LL.h
//  YRJJApp
//
//  Created by luwenlong on 14-11-25.
//  Copyright (c) 2014年 luwelong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LL)
+ (UIImage *)resizedImageNamed:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale;

/**
 *  返回一张可以任意拉伸的图片
 *
 *  @param name 图片名
 *
 */
+ (UIImage *)resizedImageNamed:(NSString *)name;
@end
