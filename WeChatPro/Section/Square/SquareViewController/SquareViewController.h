//
//  SquareViewController.h
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AgantViewController.h"
#import "Supply ViewController.h"
#import "SquareListTableViewCell.h"
@interface SquareViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *squreListtable;
@end
