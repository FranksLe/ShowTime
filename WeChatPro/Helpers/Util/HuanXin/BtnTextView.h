//
//  BtnTextView.h
//  YRJJApp
//
//  Created by panbin on 15/1/31.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BtnTextView : UIButton

- (id)initWithFrame:(CGRect)frame withIconName:(NSString *)iconName withNumTitle:(NSString *)title;

- (void)fillWithObject:(id)object;

@end
