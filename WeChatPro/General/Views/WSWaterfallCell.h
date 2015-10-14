//
//  TSWaterfallCell.h
//  taosha
//
//  Created by lienbao on 16/05/2014.
//  Copyright (c) 2014 com.b5m.taosha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSWaterfallCell : UICollectionViewCell

- (void)waterfallCellWithData:(id)data forIndexPath:(NSIndexPath *)indexPath;

- (void)autoLayoutSubviews;

+ (CGFloat)cellHeight;

+ (CGFloat)cellHeightAccordTo:(id)data width:(CGFloat)width indexPath:(NSIndexPath *)indexPath;

@end
