//
//  ProductViewController.m
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "ProductViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *clearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 54)];
    clearView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = clearView;
    //标题
    UILabel *labelSetting = [[UILabel alloc] initWithFrame:CGRectMake(-10, 20, self.view.frame.size.width, 18)];
    labelSetting.text = @"商品";
    [labelSetting setTextColor:[UIColor blackColor]];
    labelSetting.textAlignment = NSTextAlignmentCenter;
    [clearView addSubview:labelSetting];
    
    self.GoodsTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.GoodsTableView.delegate  = self;
    self.GoodsTableView.dataSource = self;
    [self.view addSubview:self.GoodsTableView];
    [self addHeader];
    [self addFooter];
    // Do any additional setup after loading the view.
}
-(void)addHeader
{
    //[self getMoreData:1];
    [self getMoreData:1];
    __weak typeof(self) VC = self;
    [self.GoodsTableView addLegendHeaderWithRefreshingBlock:^{
        VC.isUpLoading = NO;
        VC.pageIndex = 2;
        [VC getMoreData:1];
    }];
}

-(void)addFooter
{
    __weak typeof(self) VC = self;
    [self.GoodsTableView addLegendFooterWithRefreshingBlock:^{
        VC.isUpLoading = YES;
        [VC getMoreData:(VC.pageIndex++)];
        
    }];
}

-(void)getMoreData:(NSInteger)index{
    
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setObject:[NSString stringWithFormat:@"%ld",(long)index]forKey:@"pageIndex"];
        [params setObject:@"" forKey:@"userId"];
#pragma mark 网络请求方法一
        [[NetworkManager sharedInstance] GET:@"square/photoGallery"
                                      params:params
                                     success:^(id responseObject) {
                                         NSDictionary *datadic = responseObject;
                                         if (self.isUpLoading == NO) {
                                         }
                                       
                                         [self.GoodsTableView.footer endRefreshing];
                                         [self.GoodsTableView.header endRefreshing];
                                         [self.GoodsTableView reloadData];
                                     }
                                     failure:^(NSError *error) {
                                         [self.GoodsTableView.footer endRefreshing];
                                         [self.GoodsTableView.header endRefreshing];
                                         
                                     }];
        
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellde = @"cellde";
    GoodsListTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellde];
    if (cell == nil) {
        cell = [[GoodsListTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellde];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
    // Do any additional setup after loading the view.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
