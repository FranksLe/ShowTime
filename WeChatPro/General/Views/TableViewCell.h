//
//  TableViewCell.h
//  DigitalGeek
//
//  Created by lienbao on 19/08/2014.
//  Copyright (c) 2014 com.lienbao.digitalgeek. All rights reserved.
//

#import <UIKit/UIKit.h>

#define title_font       [UIFont defaultFontOfSize:16.0f]
#define description_font [UIFont defaultFontOfSize:12.0f]

@interface TableViewCell : UITableViewCell

- (void)addTopLine;

- (void)addTopLineyOffset:(CGFloat)y;

- (void)addTopLinexOffset:(CGFloat)x;

- (void)addTopLine:(CGFloat)y xOffset:(CGFloat )x;

- (void)removeTopLine;

- (void)addBottomLine;

- (void)addBottomLineyOffset:(CGFloat)y;

- (void)addBottomLinexOffset:(CGFloat)x;

- (void)addBottomLine:(CGFloat)y xOffset:(CGFloat )x;

- (void)addBottomLine:(CGFloat )x width:(CGFloat )width;

- (void)removeBottomLine;

- (void)tableViewCellWithData:(id)data forIndexPath:(NSIndexPath *)indexPath;

+ (CGFloat)cellHeight;

+ (CGFloat)accordHeight:(id)data forIndexPath:(NSIndexPath *)indexPath;

@end
