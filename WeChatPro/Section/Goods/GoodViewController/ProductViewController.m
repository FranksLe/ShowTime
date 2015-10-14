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
    self.navigationItem.title = @"商品";
    
    self.GoodsTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.GoodsTableView.delegate  = self;
    self.GoodsTableView.dataSource = self;
    [self.view addSubview:self.GoodsTableView];
    // Do any additional setup after loading the view.
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
    return cell;
}
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
