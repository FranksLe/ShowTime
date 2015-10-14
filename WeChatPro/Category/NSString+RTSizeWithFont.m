//
//  NSString+ContentSize.m
//  UIComponents
//
//  Created by liu lh on 13-11-21.
//  Copyright (c) 2013年 anjuke inc. All rights reserved.
//

#import "NSString+RTSizeWithFont.h"

@implementation NSString (RTSizeWithFont)

- (CGSize)rtSizeWithFont:(UIFont *)font
{
    return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}

- (CGSize)rtSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
        return [self boundingRectWithSize:size
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:font}
                                  context:nil].size;
}

- (CGSize)rtSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode{
        return [self boundingRectWithSize:size
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:font}
                                  context:nil].size;
}
@end
