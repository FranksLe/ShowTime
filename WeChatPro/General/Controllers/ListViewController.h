//
//  WSListViewController.h
//  DigitalGeek
//
//  Created by lienbao on 19/08/2014.
//  Copyright (c) 2014 com.lienbao.digitalgeek. All rights reserved.
//

#import "BaseViewController.h"
#import "TableViewCell.h"
#import "MJRefresh.h"

@interface ListViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)   NSMutableArray *dataSource;
@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, strong)   NSString *tableViewCellClassName;

@property (nonatomic, assign)   NSInteger pageSize;
@property (nonatomic, assign)   NSInteger pageIndex;

- (void)refreshData;

- (void)stopAnimating;

- (void)loadMore;

- (void)loadDataFinished:(NSArray *)items;

- (void)loadDataFinished:(NSArray *)items isMore:(BOOL)isMore;

- (void)loadDataError:(NSError *)error;

- (void)didSelectedItem:(id)selectedItem;

@end
