//
//  TSWaterfallCell.m
//  taosha
//
//  Created by lienbao on 16/05/2014.
//  Copyright (c) 2014 com.b5m.taosha. All rights reserved.
//

#import "WSWaterfallCell.h"

@interface WSWaterfallCell ()

@end

@implementation WSWaterfallCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
	// Initialization code
    }
    return self;
}

- (void)waterfallCellWithData:(id)data forIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)autoLayoutSubviews
{

}

+ (CGFloat)cellHeight
{
    return 105.0f;
}

+ (CGFloat)cellHeightAccordTo:(id)data width:(CGFloat)width indexPath:(NSIndexPath *)indexPath
{
    return [self cellHeight];
}

@end
