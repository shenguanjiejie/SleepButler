//
//  MainViewController.m
//  睡眠管家
//
//  Created by srj on 15/6/5.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import "SSMainViewController.h"
#import "SSSleepModelTool.h"
#import "SSAddSleepRecordVC.h"


#define initTime @"00:00:00"

@interface SSMainViewController ()
{
//    NSUserDefaults *_userPreferences;
    NSTimer *_timer;
    SSSleepModel *_sleepModel;
}

@property (weak, nonatomic) IBOutlet UIButton *sleepBtn;
@property (weak, nonatomic) IBOutlet UILabel *alreadySleepLab;
@property (weak, nonatomic) IBOutlet UILabel *alreadyAwakeLab;

@end

@implementation SSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(save) name:@"SaveSeccessed" object:nil];
//    _userPreferences = [[NSUserDefaults alloc]init];
    _timer = [[NSTimer alloc]init];
    _sleepModel = [[SSSleepModel alloc]init];
    [self.sleepBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonPress:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"开始睡觉"])
    {
        [self.sleepBtn setTitle:@"醒来" forState:UIControlStateNormal];
        self.alreadyAwakeLab.text = initTime;
        _sleepModel.sleepStartDate = [NSDate date];
        [self stopTimer];
        [self startCountingSleepTime];
//        [_userPreferences setValue:@"睡覺" forKey:@"sleepStatus"];
    }else {
        _sleepModel.awakeStartDate = [NSDate date];
        _sleepModel.interval = self.alreadySleepLab.text;
        
        UINavigationController *AddNav = [self.storyboard instantiateViewControllerWithIdentifier:@"AddSleepRecord"];
        SSAddSleepRecordVC *addVC = [AddNav.viewControllers lastObject];
        addVC.sleepModel = _sleepModel;
        [self presentViewController:AddNav animated:YES completion:nil];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)save{
    [self.sleepBtn setTitle:@"开始睡觉" forState:UIControlStateNormal];
    self.alreadySleepLab.text = initTime;
    _sleepModel.awakeStartDate = [NSDate date];
    [self stopTimer];
    [self startCountingAwakeTime];
}


#pragma mark - timer

- (void)stopTimer
{
    [_timer invalidate];
    _timer = nil;
}

- (void)startCountingSleepTime
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(updateTime)
                                           userInfo:@"Go To Bed"
                                            repeats:YES];
}

- (void)startCountingAwakeTime
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(updateTime)
                                           userInfo:@"Wake Up"
                                            repeats:YES];
}

- (void)updateTime
{
    if ([_timer.userInfo isEqualToString:@"Go To Bed"]) {
        self.alreadySleepLab.text = [self stringFromTimeIntervalSinceDate:_sleepModel.sleepStartDate toDate:[NSDate date]];  //即時顯示已經睡了多久時間
    }else{
        self.alreadyAwakeLab.text = [self stringFromTimeIntervalSinceDate:_sleepModel.awakeStartDate toDate:[NSDate date]];  //即時顯示已經醒了多久
    }
}

- (NSString *)stringFromTimeIntervalSinceDate:(NSDate *)startDate toDate:(NSDate *)endDate
{
    NSInteger time = (NSInteger)[endDate timeIntervalSinceDate:startDate];
    NSInteger seconds = time % 60; // ％取餘數
    NSInteger minutes = (time / 60) % 60;
    NSInteger hours = (time / 3600);
    return [NSString stringWithFormat:@"%02li:%02li:%02li", (long)hours, (long)minutes, (long)seconds];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SaveSeccessed" object:nil];
}


@end
