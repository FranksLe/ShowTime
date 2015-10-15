//
//  AgantViewController.m
//  WeChatPro
//
//  Created by 郭金涛 on 15/10/15.
//  Copyright © 2015年 李赐岩. All rights reserved.
//

#import "AgantViewController.h"

@interface AgantViewController ()

@end

@implementation AgantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *clearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 54)];
    clearView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = clearView;
    //标题
    UILabel *labelSetting = [[UILabel alloc] initWithFrame:CGRectMake(95, 20, 60, 18)];
    labelSetting.text = @"代理商";
    //labelSetting.backgroundColor = [UIColor redColor];
    [labelSetting setTextColor:[UIColor blackColor]];
    [clearView addSubview:labelSetting];
    
    
    self.agentListTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.agentListTable.delegate = self;
    self.agentListTable.dataSource = self;
    [self.view addSubview:self.agentListTable];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellde = @"cellde";
    AgentTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellde];
    if (cell == nil) {
        cell = [[AgentTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellde];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
