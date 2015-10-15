//
//  FoundViewController.h
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoundTableViewCell.h"
@interface FoundViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *foundTableView;


@end
