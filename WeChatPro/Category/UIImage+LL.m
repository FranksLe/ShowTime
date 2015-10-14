//
//  UIImage+LL.m
//  YRJJApp
//
//  Created by luwenlong on 14-11-25.
//  Copyright (c) 2014年 luwelong. All rights reserved.
//

#import "UIImage+LL.h"

@implementation UIImage (LL)
/**
 *  返回一张可以任意拉伸的图片
 *
 *  @param name 图片名
 *
 */
+ (UIImage *)resizedImageNamed:(NSString *)name
{
    return [self resizedImageNamed:name leftScale:0.5 topScale:0.5];
}

+ (UIImage *)resizedImageNamed:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * leftScale topCapHeight:image.size.height * topScale];
}
@end
