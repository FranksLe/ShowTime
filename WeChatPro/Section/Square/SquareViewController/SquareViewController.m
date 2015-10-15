//
//  SquareViewController.m
//  WeChatPro
//
//  Created by 李赐岩 on 15/10/14.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "SquareViewController.h"

@interface SquareViewController ()

@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *clearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 54)];
    clearView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = clearView;
    //标题
    UILabel *labelSetting = [[UILabel alloc] initWithFrame:CGRectMake(-10, 20, self.view.frame.size.width, 18)];
    labelSetting.text = @"圈子";
    [labelSetting setTextColor:[UIColor blackColor]];
    labelSetting.textAlignment = NSTextAlignmentCenter;
    [clearView addSubview:labelSetting];
    
    
    self.squreListtable = [[UITableView alloc] initWithFrame:CGRectMake(0 , 0, self.view.frame.size.width, 100)];
    self.squreListtable.delegate = self;
    self.squreListtable.dataSource = self;
    [self.view addSubview:self.squreListtable];
    

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellde = @"cellde";
    SquareListTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellde];
    if (cell == nil) {
        cell = [[SquareListTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue2) reuseIdentifier:cellde];
    }
    if (indexPath.row == 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 150, 30)];
        label.text = @"代理商";
        [cell addSubview:label];
    }
    if (indexPath.row == 1) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 150, 30)];
        label.text = @"供应商";
        [cell addSubview:label];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        AgantViewController *agentVc = [[AgantViewController alloc] init];
        [self.navigationController pushViewController:agentVc animated:YES];
    }else{
        Supply_ViewController *supplyVC  = [[Supply_ViewController alloc] init];
        [self.navigationController pushViewController:supplyVC animated:YES];
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
