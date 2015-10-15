//
//  SupplyTableViewCell.m
//  WeChatPro
//
//  Created by 郭金涛 on 15/10/15.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "SupplyTableViewCell.h"

@implementation SupplyTableViewCell
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
    self.headPicImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 80, 80)];
    self.headPicImage.layer.masksToBounds = YES;
    self.headPicImage.layer.cornerRadius = self.headPicImage.frame.size.width / 2;
    self.headPicImage.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.headPicImage];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headPicImage.frame.origin.x + self.headPicImage.frame.size.width + 10, self.headPicImage.frame.origin.y + 10, 150, 30)];
    self.nameLabel.text = @"速道科技";
    [self addSubview:self.nameLabel];
    
    
    self.phoneLbel = [[UILabel alloc] initWithFrame:CGRectMake(self.headPicImage.frame.origin.x + self.headPicImage.frame.size.width + 10, self.nameLabel.frame.origin.y + self.nameLabel.frame.size.height, 150, 30)];
    self.phoneLbel.font = [UIFont systemFontOfSize:13];
    self.phoneLbel.text = @"手机号:1888888888";
    [self addSubview:self.phoneLbel];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
