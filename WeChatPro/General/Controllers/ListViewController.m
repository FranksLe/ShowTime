//
//  ListViewController.m
//  B5M
//
//  Created by lienbao on 01/09/2014.
//  Copyright (c) 2014 b5m. All rights reserved.
//

#import "ListViewController.h"
#import "TableViewCell.h"
#import "UIView+Frame.h"

@interface ListViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL isLoadingData;

@end

@implementation ListViewController

#pragma mark - getter and settter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[self.view mainFrame] style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor whiteColor];
        
        __weak ListViewController *blockSelf = self;
//        [_tableView addLegendHeaderWithRefreshingBlock:^{
//            if (!blockSelf.isLoadingData) {
//                [blockSelf refreshData];
//            }
//        }];
//   
//        [_tableView addLegendFooterWithRefreshingBlock:^{
//            if (!blockSelf.isLoadingData) {
//                [blockSelf loadMore];
//            }
//        }];
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tableViewCellClassName = @"TableViewCell";
        self.isLoadingData = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView.footer setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshData
{
    self.pageIndex = 1;
    self.pageSize  = 10;
    self.isLoadingData = YES;
    [self hiddenEmptyOrErrorView];
}

- (void)stopAnimating
{
    [self.tableView.header endRefreshing];
    [self.tableView.footer endRefreshing];
}

- (void)loadDataFinished:(NSArray *)items
{
    [self loadDataFinished:items isMore:NO];
}

- (void)loadDataFinished:(NSArray *)items isMore:(BOOL)isMore
{
    [self stopAnimating];
    [self setIsLoadingData:NO];
    if ([items count]) {
        self.pageIndex++;
        [self.dataSource addObjectsFromArray:items];
    }
    
    if (self.dataSource.count) {
        [self.tableView.footer setHidden:NO];
        if (isMore) {
            [self.tableView.footer noticeNoMoreData];
        }else{
            [self.tableView.footer resetNoMoreData];
        }
    }else {
        [self showEmptyView];
        [self.tableView.footer setHidden:YES];
    }
    
    [self.tableView reloadData];
}

- (void)loadDataError:(NSError *)error
{
    [self showMessage:[error localizedFailureReason]];
    [self loadDataFinished:nil];
    if (!self.dataSource.count) {
        [self showErrorView];
    }
}

- (void)loadMore
{
    self.isLoadingData = YES;
}

- (void)didEmptyViewCliked:(EmptyTipView *)emptyView
{
    [self hiddenEmptyOrErrorView];
    [self.tableView.header beginRefreshing];
}

- (void)didSelectedItem:(id)selectedItem
{
    
}

#pragma mark - UITableViewDelegate / UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identitify = [NSClassFromString(self.tableViewCellClassName) description];
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identitify];
    if (!cell) {
        cell = [[NSClassFromString(self.tableViewCellClassName) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identitify];
    }
    
    if (indexPath.row < self.dataSource.count) {
        [cell tableViewCellWithData:[self.dataSource objectAtIndex:indexPath.row] forIndexPath:indexPath];
        [cell removeTopLine];
        if (indexPath.row == 0) {
            [cell addTopLine];
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= self.dataSource.count) {
        return [[((TableViewCell *)NSClassFromString(self.tableViewCellClassName)) class] cellHeight];
    }
    return [[((TableViewCell *)NSClassFromString(self.tableViewCellClassName)) class] accordHeight:[self.dataSource objectAtIndex:indexPath.row] forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.dataSource.count > indexPath.row) {
        [self didSelectedItem:[self.dataSource objectAtIndex:indexPath.row]];
    }
}

@end
