//
//  MineViewController.m
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationItem.title = @"我";
    self.whiteBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 0.2)];
    self.whiteBackGroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.whiteBackGroundView];
    
    self.headImagView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 26, 80, 80)];
    self.headImagView.image = [UIImage imageNamed:@"userHeadImage"];
    self.headImagView.layer.masksToBounds = YES;
    self.headImagView.layer.cornerRadius = self.headImagView.frame.size.width / 2;
    [self.whiteBackGroundView addSubview:self.headImagView];
    
    self.nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImagView.frame.origin.x + self.headImagView.frame.size.width + 15, self.headImagView.frame.origin.y + self.headImagView.frame.size.height / 2 - 8, 60, 20)];
    self.nickNameLabel.text = @"么么";
    self.nickNameLabel.font = [UIFont systemFontOfSize:16];
    [self.whiteBackGroundView addSubview:self.nickNameLabel];
    UILabel *vertificationLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nickNameLabel.frame.origin.x + self.nickNameLabel.frame.size.width, self.nickNameLabel.frame.origin.y + 2, 45, 16)];
    vertificationLabel.text = @"未认证";
    vertificationLabel.font = [UIFont systemFontOfSize:14];
    vertificationLabel.backgroundColor = [UIColor grayColor];
    [vertificationLabel setTextColor:[UIColor whiteColor]];
    [self.whiteBackGroundView addSubview:vertificationLabel];
    
    self.mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.whiteBackGroundView.frame.origin.y + self.whiteBackGroundView.frame.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.whiteBackGroundView.frame.size.height) style:UITableViewStylePlain];
    self.mineTableView.delegate = self;
    self.mineTableView.dataSource = self;
//    self.mineTableView.scrollEnabled = NO;
    self.mineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.mineTableView];
    UIView *foundFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10)];
    foundFooterView.backgroundColor = [UIColor colorWithRed:238 / 255.0 green:238 / 255.0 blue:238 / 255.0 alpha:1.0];
    self.mineTableView.tableFooterView = foundFooterView;
    
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}//section number

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}//height



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifer = @"cell";
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifer];
    if (cell == nil) {
        cell = [[MineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifer];
    }
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.backgroundColor = [UIColor whiteColor];
        cell.cellImageView.image = [UIImage imageNamed:@"myOrder"];
        cell.cellLabel.text = @"我的订单";
    }else if (indexPath.section == 0 && indexPath.row == 1){
        cell.cellImageView.image = [UIImage imageNamed:@"myPurse"];
        cell.cellLabel.text = @"我的钱包";
    }else if (indexPath.section == 0 && indexPath.row == 2){
        cell.cellImageView.image = [UIImage imageNamed:@"myShop"];
        cell.cellLabel.text = @"我的店铺";
    }else if (indexPath.section == 1 && indexPath.row == 0){
        cell.cellImageView.image = [UIImage imageNamed:@"setting"];
        cell.cellLabel.text = @"设置";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
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
