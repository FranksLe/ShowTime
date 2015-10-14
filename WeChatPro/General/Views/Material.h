//
//  Material.h
//  Artist
//
//  Created by lienbao on 15/4/20.
//  Copyright (c) 2015年 lienbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Material;

@protocol MaterialDelegate <NSObject>

@optional
- (void)materialViewDidBeginEditing:(Material *)material;
- (void)materialViewDidEndEditing:(Material *)material;
- (void)materialViewDidCancelEditing:(Material *)material;
- (void)materialViewDidClose:(Material *)material;

@end

@interface Material : UIImageView

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic) BOOL preventsPositionOutsideSuperview; //default = YES
@property (nonatomic) BOOL preventsResizing; //default = NO
@property (nonatomic) BOOL preventsDeleting; //default = NO
@property (nonatomic) CGFloat minWidth;
@property (nonatomic) CGFloat minHeight;
@property (nonatomic, weak) id<MaterialDelegate> delegate;

- (instancetype)initWithContentView:(UIView *)contentView;


- (void)setBackgroundImage:(UIImage *)image;
- (void)hideEditing;
- (void)showEditing;

@end
