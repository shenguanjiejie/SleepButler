//
//  SSSleepModal.h
//  睡眠管家
//
//  Created by srj on 15/6/5.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSSleepModel : NSObject<NSCoding>

@property (strong, nonatomic) NSDate *sleepStartDate;
@property (strong, nonatomic) NSDate *awakeStartDate;
@property (copy, nonatomic) NSString *interval;

@end
