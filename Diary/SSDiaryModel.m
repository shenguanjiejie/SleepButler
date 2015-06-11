//
//  SSDiaryModel.m
//  SleepButler
//
//  Created by srj on 15/6/11.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import "SSDiaryModel.h"

#define kDate @"date"
#define kWeather @"weather"
#define kMood @"mood"
#define kImage @"image"
#define kContent @"content"


@interface SSDiaryModel ()

@end

@implementation SSDiaryModel

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.date = [aDecoder decodeObjectForKey:kDate];
        self.weather = [aDecoder decodeObjectForKey:kWeather];
        self.mood = [aDecoder decodeObjectForKey:kMood];
        self.image = [aDecoder decodeObjectForKey:kImage];
        self.content = [aDecoder decodeObjectForKey:kContent];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.date forKey:kDate];
    [aCoder encodeObject:self.weather forKey:kWeather];
    [aCoder encodeObject:self.mood forKey:kMood];
    [aCoder encodeObject:self.image forKey:kImage];
    [aCoder encodeObject:self.content forKey:kContent];
}

@end
