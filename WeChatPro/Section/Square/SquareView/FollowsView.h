//
//  FollowsView.h
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/19.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowView.h"

typedef NS_ENUM(NSInteger, XYZPhotoState){
    XYZPhotoStateNormal,
    XYZPhotoStateBig,
    XYZPhotoStateDraw,
    XYZPhotoStateTogether
};

@interface FollowsView : UIView
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) FollowView *drawView;
@property (nonatomic) float speed;
@property (nonatomic) CGRect oldFrame;
@property (nonatomic) float oldSpeed;
@property (nonatomic) float oldAlpha;
@property (nonatomic) int state;
- (void)updateImage:(UIImage *)image;
- (void)setImageAlphaAndSpeedAndSize:(float)alpha;
@end
