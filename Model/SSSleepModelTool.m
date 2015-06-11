
//
//  SSSleepModelTool.m
//  睡眠管家
//
//  Created by srj on 15/6/6.
//  Copyright (c) 2015年 srj. All rights reserved.
//

#import "SSSleepModelTool.h"

#define fileName @"records.data"

#define filePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileName]


@implementation SSSleepModelTool

//- (instancetype)init{
//    if (self = [super init]) {
//        _allSleepModel = [NSMutableArray arrayWithContentsOfFile:filePath];
//        if (!_allSleepModel) {
//            _allSleepModel = [NSMutableArray array];
//        }
//    }
//    return self;
//}



- (void)addSleepModel:(SSSleepModel *)model{
    if (model) {
        NSMutableArray *array = [self getAllSleepModel];
        [array addObject:model];
        [self archiveArray:array];
    }
}

- (void)remove:(SSSleepModel *)model{
    if (model) {
        NSMutableArray *array = [self getAllSleepModel];
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([[obj sleepStartDate] isEqual:model.sleepStartDate]) {
                *stop = YES;
                [array removeObject:obj];
                [self archiveArray:array];
            }
        }];
    }
}


- (void)archiveArray:(NSArray *)array{
    NSMutableData *data = [[NSMutableData alloc] init];
    //创建归档辅助类
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //编码
    [archiver encodeObject:array forKey:@"sleepList"];
    //结束编码
    [archiver finishEncoding];
    //写入
    [data writeToFile:filePath atomically:YES];
}

- (NSMutableArray *)getAllSleepModel{
    NSMutableArray *array = [NSMutableArray array];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    if (data.length > 0) {
        NSKeyedUnarchiver *archiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        //编码
        array = [archiver decodeObjectForKey:@"sleepList"];
        //结束编码
        [archiver finishDecoding];
    }
    
    return array;
}

+ (NSDateFormatter *) MyDateFormatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    return dateFormatter;
}

//+ (id)getSleepModel{
//    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
//}

//- (void)addSleepModel:(SSSleepModel *)sleepModel{
//    if (sleepModel) {
////        [_allSleepModel addObject:sleepModel];
//        [_allSleepModel addObject:@"test"];
//        [_allSleepModel writeToFile:filePath atomically:YES];
//    }
//    
//}
//
//- (void)removeSleepModel:(SSSleepModel *)sleepModel{
//    if (sleepModel) {
//        [_allSleepModel removeObject:sleepModel];
//        [_allSleepModel writeToFile:filePath atomically:YES];
//    }
//}




@end
