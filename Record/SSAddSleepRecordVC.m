//
//  SSAddSleepRecordVC.m
//  睡眠管家
//
//  Created by srj on 15/6/5.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import "SSAddSleepRecordVC.h"
#import "SSSleepModelTool.h"


@interface SSAddSleepRecordVC ()


@end

@implementation SSAddSleepRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}


- (IBAction)save:(id)sender
{
    SSSleepModelTool *tool = [[SSSleepModelTool alloc]init];
    [tool addSleepModel:self.sleepModel];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SaveSeccessed" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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

@end
