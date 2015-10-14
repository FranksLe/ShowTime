//
//  ProductViewController.h
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsListTableViewCell.h"
@interface ProductViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *GoodsTableView;
@end
