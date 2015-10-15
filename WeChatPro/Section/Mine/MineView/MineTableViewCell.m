//
//  MineTableViewCell.m
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/15.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "MineTableViewCell.h"

@implementation MineTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatView];
    }
    return self;
}

-(void)creatView
{
    self.cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 30, 30)];
    [self.contentView addSubview:self.cellImageView];
    self.cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.cellImageView.frame.origin.x + self.cellImageView.frame.size.width + 20, self.cellImageView.frame.origin.y, 200, 30)];
    self.cellLabel.textAlignment = NSTextAlignmentLeft;
    self.cellLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:self.cellLabel];
    
    UILabel *grayLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.frame.size.height + 5, [UIScreen mainScreen].bounds.size.width - 15, 1)];
    grayLabel.backgroundColor = [UIColor colorWithRed:238 / 255.0 green:238 / 255.0 blue:238 / 255.0 alpha:1];
    [self.contentView addSubview:grayLabel];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
