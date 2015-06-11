//
//  SSSleepModal.m
//  睡眠管家
//
//  Created by srj on 15/6/5.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import "SSSleepModel.h"

#define kSleepStartDate @"sleepStartDate"
#define kAwakeStartDate @"awakeStartDate"
#define kInterval @"interval"
#define knote @"note"

@implementation SSSleepModel

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.sleepStartDate = [aDecoder decodeObjectForKey:kSleepStartDate];
        self.awakeStartDate = [aDecoder decodeObjectForKey:kAwakeStartDate];
        self.interval = [aDecoder decodeObjectForKey:kInterval];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.sleepStartDate forKey:kSleepStartDate];
    [aCoder encodeObject:self.awakeStartDate forKey:kAwakeStartDate];
    [aCoder encodeObject:self.interval forKey:kInterval];
}


@end
