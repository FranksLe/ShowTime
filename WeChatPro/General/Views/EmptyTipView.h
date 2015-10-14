//
//  WSEmptyTipView.h
//  DigitalGeek
//
//  Created by lienbao on 17/08/2014.
//  Copyright (c) 2014 com.lienbao.digitalgeek. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmptyTipView;
@protocol EmptyTipViewDelegate <NSObject>

@optional
- (void)didEmptyViewCliked:(EmptyTipView *)emptyView;

@end

@interface EmptyTipView : UIView

@property (nonatomic, weak) id<EmptyTipViewDelegate> delegate;

- (void)setUpEmptyView:(UIImage *)image tips:(NSString *)tips;

@end

