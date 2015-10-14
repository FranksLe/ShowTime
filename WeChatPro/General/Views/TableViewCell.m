//
//  WSTableViewCell.m
//  DigitalGeek
//
//  Created by lienbao on 19/08/2014.
//  Copyright (c) 2014 com.lienbao.digitalgeek. All rights reserved.
//

#import "TableViewCell.h"
#import "UIView+Frame.h"
#import "UIColor+Additions.h"
#import "AppMacro.h"

@interface TableViewCell ()

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        _topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        _topLine.backgroundColor = [UIColor colorWithHex:0xcbcbcb alpha:1.0f];
        
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        _bottomLine.backgroundColor = [UIColor colorWithHex:0xcbcbcb alpha:1.0f];
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)addTopLine
{
    [self addTopLineyOffset:0.5];
}

- (void)addTopLineyOffset:(CGFloat)y
{
    [self addTopLine:y xOffset:0];
}

- (void)addTopLinexOffset:(CGFloat)x
{
    [self addTopLine:0.5 xOffset:x];
}

- (void)addTopLine:(CGFloat)y xOffset:(CGFloat )x
{
    _topLine.frame = CGRectMake(x, y, SCREEN_WIDTH, 0.5);
    if (![_topLine superview]) {
        [self.contentView addSubview:_topLine];
    }
}

- (void)removeTopLine
{
    [_topLine removeFromSuperview];
}

- (void)addBottomLine
{
    [self addBottomLineyOffset:[[self class] cellHeight] - 0.5];
}

- (void)addBottomLineyOffset:(CGFloat)y
{
    [self addBottomLine:y xOffset:0];
}

- (void)addBottomLinexOffset:(CGFloat)x
{
    [self addBottomLine:[[self class] cellHeight] - 0.5 xOffset:x];
}

- (void)addBottomLine:(CGFloat)y xOffset:(CGFloat )x
{
    _bottomLine.frame = CGRectMake(x, y, SCREEN_WIDTH, 0.5);
    if (![_bottomLine superview]) {
        [self.contentView addSubview:_bottomLine];
    }
}

- (void)addBottomLine:(CGFloat )x width:(CGFloat )width
{
    _bottomLine.frame = CGRectMake(x, [[self class] cellHeight] - 0.5, width, 0.5);
    if (![_bottomLine superview]) {
        [self.contentView addSubview:_bottomLine];
    }
}

- (void)removeBottomLine
{
    [_bottomLine removeFromSuperview];
}

- (void)tableViewCellWithData:(id)data forIndexPath:(NSIndexPath *)indexPath
{

}

+ (CGFloat)cellHeight
{
    return 44;
}

+ (CGFloat)accordHeight:(id)data forIndexPath:(NSIndexPath *)indexPath
{
    return [self cellHeight];
}

@end
