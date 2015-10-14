//
//  BtnTextView.m
//  YRJJApp
//
//  Created by panbin on 15/1/31.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import "BtnTextView.h"
#import "IconsModel.h"

#define BTN_WIDHT 28
#define BTN_HEIGHT 24

@interface BtnTextView()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *numLabel;

@end

@implementation BtnTextView

- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_iconImageView];
    }
    
    return _iconImageView;
}

- (UILabel *)numLabel
{
    if (_numLabel == nil) {
        _numLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _numLabel.backgroundColor = [UIColor clearColor];
        _numLabel.textColor = [UIColor whiteColor];
        _numLabel.font = [UIFont systemFontOfSize:16.0f];
        [self addSubview:_numLabel];
    }
    
    return _numLabel;
}

- (id)initWithFrame:(CGRect)frame withIconName:(NSString *)iconName withNumTitle:(NSString *)title;
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self.iconImageView setImage:[UIImage imageNamed:iconName]];
        self.numLabel.text = title;
    }
    
    return self;
}

- (void)fillWithObject:(id)object
{
    IconsModel *model = (IconsModel *)object;
    
    [self.iconImageView setImage:[UIImage imageNamed:model.iconName]];
    self.numLabel.text = model.iconTitle;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.iconImageView.frame = CGRectMake((self.bounds.size.width - BTN_WIDHT)/2 - 16, (self.bounds.size.height - BTN_HEIGHT)/2, BTN_WIDHT, BTN_HEIGHT);
    
    self.numLabel.frame = CGRectMake(self.iconImageView.frame.origin.x + self.iconImageView.frame.size.width + 5, 0, 20, self.bounds.size.height);
    
}

@end
