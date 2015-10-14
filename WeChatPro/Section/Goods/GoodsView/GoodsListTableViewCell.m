//
//  GoodsListTableViewCell.m
//  WeChatPro
//
//  Created by 郭金涛 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "GoodsListTableViewCell.h"

@implementation GoodsListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatView];
    }
    return self;
}
- (void)creatView
{
    self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    self.picImageView.backgroundColor = [UIColor redColor];
    [self addSubview:self.picImageView];
    
    self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.picImageView.frame.origin.x + self.picImageView.frame.size.width + 20, self.picImageView.frame.origin.y, 30, 150)];
    self.goodsNameLabel.text = @"3M手套3(11)";
    [self addSubview:self.goodsNameLabel];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
