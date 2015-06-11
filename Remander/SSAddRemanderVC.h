//
//  SSAddRemanderVC.h
//  SleepButler
//
//  Created by srj on 15/6/9.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSAddRemanderVC : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *itemText;

- (IBAction)Save:(id)sender;


@end
