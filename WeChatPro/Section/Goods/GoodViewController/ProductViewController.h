//
//  ProductViewController.h
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsListTableViewCell.h"
#import "MJRefresh.h"
#import "AFNetworking.h"
#import "NetworkManager.h"
@interface ProductViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *GoodsTableView;
@property (nonatomic, assign) BOOL isUpLoading;
@property (nonatomic, assign) NSInteger pageIndex;

@end

