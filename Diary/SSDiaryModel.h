//
//  SSDiaryModel.h
//  SleepButler
//
//  Created by srj on 15/6/11.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSDiaryModel : NSObject

@property (strong, nonatomic) NSDate *date;
@property (copy, nonatomic) NSString *weather;
@property (copy, nonatomic) NSString *mood;
@property (strong, nonatomic) UIImage *image;
@property (copy, nonatomic) NSString *content;

@end
