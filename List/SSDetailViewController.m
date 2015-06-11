//
//  DetailViewController.m
//  睡眠管家
//
//  Created by srj on 15/6/6.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import "SSDetailViewController.h"
#import "SSSleepModelTool.h"

@interface SSDetailViewController ()
//@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark - tableViewDelegate & tableViewDataSource
// 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
// 行高,调用顺序比cellForRowAtIndexPath方法优先
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

// 点击Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

// Cell循环利用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"睡觉时间:";
        cell.detailTextLabel.text = [[SSSleepModelTool MyDateFormatter] stringFromDate:self.sleepModel.sleepStartDate];
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"醒来时间:";
        cell.detailTextLabel.text = [[SSSleepModelTool MyDateFormatter] stringFromDate:self.sleepModel.awakeStartDate];
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"睡了多久:";
        cell.detailTextLabel.text = self.sleepModel.interval;
    }
    
    
    return cell;
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end
