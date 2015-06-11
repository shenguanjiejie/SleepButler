//
//  DetailViewController.h
//  睡眠管家
//
//  Created by srj on 15/6/6.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSSleepModel.h"

@interface SSDetailViewController : UITableViewController

@property (strong, nonatomic) SSSleepModel *sleepModel;

@end
