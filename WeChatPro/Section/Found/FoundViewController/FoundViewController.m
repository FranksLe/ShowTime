//
//  FoundViewController.m
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "FoundViewController.h"

@interface FoundViewController ()

@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.foundTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.foundTableView.delegate = self;
    self.foundTableView.dataSource = self;
//    self.foundTableView.scrollEnabled = NO;
    self.foundTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.foundTableView];
    
    UIView *foundFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10)];
    foundFooterView.backgroundColor = [UIColor colorWithRed:238 / 255.0 green:238 / 255.0 blue:238 / 255.0 alpha:1.0];
    self.foundTableView.tableFooterView = foundFooterView;
    // Do any additional setup after loading the view.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"cell";
    FoundTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[FoundTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.cellImageView.image = [UIImage imageNamed:@"frandProduct"];
        cell.cellLabel.text = @"品牌汇";
    }else if (indexPath.section == 0 && indexPath.row == 1){
        cell.cellImageView.image = [UIImage imageNamed:@"knowledge"];
        cell.cellLabel.text = @"知识云";
    }else if (indexPath.section == 1 && indexPath.row == 0){
        cell.cellImageView.image = [UIImage imageNamed:@"productNotification"];
        cell.cellLabel.text = @"商品通道";
    }else if (indexPath.section == 1 && indexPath.row == 1){
        cell.cellImageView.image = [UIImage imageNamed:@"orderNotification"];
        cell.cellLabel.text = @"订单通知";
    }else if (indexPath.section == 1 && indexPath.row == 2){
        cell.cellImageView.image = [UIImage imageNamed:@"purseNotification"];
        cell.cellLabel.text = @"钱包通知";
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else{
        return 3;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else{
        return 10;
    }
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
