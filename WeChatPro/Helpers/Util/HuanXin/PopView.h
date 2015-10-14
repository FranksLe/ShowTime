//
//  PopView.h
//  YRJJApp
//
//  Created by panbin on 15/1/31.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopView;

@protocol PopViewDelegate <NSObject>

- (void)popView:(PopView *)popView btnClicked:(NSInteger)btnIndex;

@end

@interface PopView : UIView

@property (nonatomic, assign) id<PopViewDelegate>delegate;

- (id)initWithFrame:(CGRect)frame withNumArray:(NSArray *)items;

- (void)fillWithObject:(NSArray *)object;

@end
