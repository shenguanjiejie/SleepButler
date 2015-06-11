//
//  SleepListTableVC.m
//  睡眠管家
//
//  Created by srj on 15/6/6.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import "SSSleepListTableVC.h"
#import "SSSleepModelTool.h"
#import "SSDetailViewController.h"
#import "SSSleepCell.h"

@interface SSSleepListTableVC ()
{
    NSMutableArray *_models;
}
@end

@implementation SSSleepListTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    SSSleepModelTool *tool  = [[SSSleepModelTool alloc]init];
    _models = [tool getAllSleepModel];
    [self.tableView reloadData];
}

- (IBAction)edit:(id)sender {
    if (self.tableView.isEditing) {
        [self.tableView setEditing:NO animated:YES];
    }else{
        [self.tableView setEditing:YES animated:YES];
    }
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
    return _models.count;
}
// 行高,调用顺序比cellForRowAtIndexPath方法优先
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SSDetailViewController *detailVC = (SSDetailViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    detailVC.sleepModel =  _models[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

// Cell循环利用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    SSSleepCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = (SSSleepCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"SleepCell" owner:self options:nil]  lastObject];
        cell.titleLab.text = @"睡觉时间:";
        cell.titleLab.font = [UIFont systemFontOfSize:16];
        cell.detailLab.font = [UIFont systemFontOfSize:14];
    }
    
    cell.detailLab.text = [[SSSleepModelTool MyDateFormatter] stringFromDate:[_models[indexPath.row] sleepStartDate]] ;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle ==UITableViewCellEditingStyleDelete) {//如果编辑样式为删除样式
        if (indexPath.row< _models.count) {
            SSSleepModelTool *tool = [[SSSleepModelTool alloc]init];
            [tool remove:_models[indexPath.row]];
            [_models removeObjectAtIndex:indexPath.row];//移除数据源的数据
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];//移除tableView中的数据
        }
    }
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
