//
//  UIImage+YC.h
//  YRJJApp
//
//  Created by luwelong on 14/12/8.
//  Copyright (c) 2014年 luwelong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+YC.h"
@interface UIImage (YC)
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;  //改变image的大小
+ (UIImage *)fixOrientation:(UIImage *)aImage;  //旋转图片
+ (UIImage*)rotateImage:(UIImage *)image; //旋转图片
+ (UIImage *)fullScreenImage:(NSString *)imageName;  //拼接后缀得到对应的图片
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

+ (UIImage* )setBackgroundImageByColor;  //使用随机颜色值生成image

+ (UIImage *)scaleAndRotateImage:(UIImage *)image; //图片上下翻转

@end
