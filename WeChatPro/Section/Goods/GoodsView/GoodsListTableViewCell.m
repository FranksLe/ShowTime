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
    
    self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.picImageView.frame.origin.x + self.picImageView.frame.size.width + 20, self.picImageView.frame.origin.y, 150, 30)];
    
    self.goodsNameLabel.text = @"3M手套3(11)";
    [self addSubview:self.goodsNameLabel];
    
    self.goodsiIntroduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsNameLabel.frame.origin.x, self.goodsNameLabel.frame.origin.y + self.goodsNameLabel.frame.size.height , 150, 20)];
    self.goodsiIntroduceLabel.text = @"最新产品";
    self.goodsiIntroduceLabel.textColor = [UIColor redColor];
    self.goodsiIntroduceLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.goodsiIntroduceLabel];
    
    self.goodsPriceLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsiIntroduceLabel.frame.origin.x, self.goodsiIntroduceLabel.frame.origin.y + self.goodsiIntroduceLabel.frame.size.height + 10, 50, 20)];
    self.goodsPriceLabel1.text = @"售价:";
    self.goodsPriceLabel1.textColor = [UIColor grayColor];
    self.goodsPriceLabel1.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.goodsPriceLabel1];
    
    self.goodsPriceLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsiIntroduceLabel.frame.origin.x + self.goodsPriceLabel1.frame.size.width , self.goodsiIntroduceLabel.frame.origin.y + self.goodsiIntroduceLabel.frame.size.height + 10, 50, 20)];
    self.goodsPriceLabel2.text = @"$100";
    self.goodsPriceLabel2.textColor = [UIColor grayColor];
    self.goodsPriceLabel2.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.goodsPriceLabel2];
    
    self.goodsProfitsLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsPriceLabel1.frame.origin.x, self.goodsPriceLabel1.frame.origin.y + self.goodsPriceLabel1.frame.size.height + 10, 50, 20)];
    self.goodsProfitsLabel1.text = @"利润:";
    self.goodsProfitsLabel1.textColor = [UIColor grayColor];
    self.goodsProfitsLabel1.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.goodsProfitsLabel1];


    self.goodsProfitsLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsPriceLabel2.frame.origin.x, self.goodsPriceLabel2.frame.origin.y + self.goodsPriceLabel2.frame.size.height + 10, 50, 20)];
    self.goodsProfitsLabel2.text = @"$5";
    self.goodsProfitsLabel2.textColor = [UIColor redColor];
    self.goodsProfitsLabel2.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.goodsProfitsLabel2];
    
    
    UIButton *agentButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    agentButton.frame = CGRectMake(self.frame.size.width - 60, self.goodsProfitsLabel2.frame.origin.y, 90, 30);
    [agentButton setTitle:@"我要代理" forState:(UIControlStateNormal)];
    agentButton.layer.masksToBounds = YES;
    agentButton.layer.cornerRadius = 7;
    agentButton.layer.borderWidth = 1;
    agentButton.layer.borderColor = [UIColor blueColor].CGColor;
    [agentButton setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [agentButton addTarget:self action:@selector(agentButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:agentButton];

}
-(void)agentButtonAction:(UIButton *)button
{
    NSLog(@"我要代理");
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
