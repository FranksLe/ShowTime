//
//  Supply ViewController.h
//  WeChatPro
//
//  Created by 郭金涛 on 15/10/15.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SupplyTableViewCell.h"
@interface Supply_ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *agentListTable;

@end
