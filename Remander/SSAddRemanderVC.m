//
//  SSAddRemanderVC.m
//  SleepButler
//
//  Created by srj on 15/6/9.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import "SSAddRemanderVC.h"

@interface SSAddRemanderVC ()

@end

@implementation SSAddRemanderVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (IBAction)Save:(id)sender {
    //隐藏键盘
    [self.itemText resignFirstResponder];
    
    NSDate *pickerDate = [self.datePicker date];
    
    //创建设置通知
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = self.itemText.text;
    localNotification.alertAction = @"Show me the item";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber]+1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    //代码内的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
