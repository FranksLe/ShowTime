//
//  AphlaSlider.m
//  Story
//
//  Created by lienbao on 15/6/26.
//  Copyright (c) 2015年 lienbao. All rights reserved.
//

#import "AphlaSlider.h"
#import "UIView+Frame.h"

@interface AphlaSlider ()

@end

@implementation AphlaSlider

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat width = 50;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, self.height)];
        _titleLabel.text = @"透明度";
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.font = [UIFont systemFontOfSize:12.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        _aphlaSlider = [[UISlider alloc] initWithFrame:CGRectMake(width, self.height/4, self.width - 2 * width, self.height/2)];
        _aphlaSlider.minimumValue = 0;
        _aphlaSlider.maximumValue = 100;
        [self addSubview:_aphlaSlider];
        
        _vauleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.width - width, 0, width, self.height)];
        _vauleLabel.text = [NSString stringWithFormat:@"%@%%", [NSNumber numberWithInteger:_aphlaSlider.value]];
        _vauleLabel.textColor = [UIColor lightGrayColor];
        _vauleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_vauleLabel];
        
    }
    return self;
}

@end
