//
//  AgantViewController.h
//  WeChatPro
//
//  Created by 郭金涛 on 15/10/15.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AgentTableViewCell.h"
@interface AgantViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *agentListTable;
@end
