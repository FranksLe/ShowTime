//
//  MineViewController.h
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineTableViewCell.h"
@interface MineViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UIView *whiteBackGroundView;
@property (nonatomic, strong) UIImageView *headImagView;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UITableView *mineTableView;

@end
