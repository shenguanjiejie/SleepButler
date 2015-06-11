//
//  SSSleepModelTool.h
//  睡眠管家
//
//  Created by srj on 15/6/6.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSleepModel.h"


@interface SSSleepModelTool : NSObject

@property (strong, nonatomic,readonly) NSMutableArray *allSleepModel;

//+ (id)getSleepModel;

+ (NSDateFormatter *) MyDateFormatter;

- (void)addSleepModel:(SSSleepModel *)model;
- (NSMutableArray *)getAllSleepModel;
- (void)remove:(SSSleepModel *)model;



//- (void)addSleepModel:(SSSleepModel *)sleepModel;
//- (void)removeSleepModel:(SSSleepModel *)sleepModel;

@end
