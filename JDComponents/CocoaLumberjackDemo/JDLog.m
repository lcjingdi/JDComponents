//
//  JDLog.m
//  JDComponents
//
//  Created by lcjingdi on 2018/1/18.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

//#define LOG_LEVEL_DEF ddLogLevel

#import "JDLog.h"
#import "JDCustomFormatter.h"

@interface JDLog()

@end

@implementation JDLog
+ (void)load {

    [self setupCocoaLumberJace];
}
+ (void)initialize {
    NSLog(@"initialize");
}
/// 设置通用参数
+ (void)setupCocoaLumberJace {

    // 增加TTY日志
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    // 格式化TTYLogger 的输出
    [DDTTYLogger sharedInstance].logFormatter = [[JDCustomFormatter alloc] init];
    
    // 增加ASL日志
//    [DDLog addLogger:[DDASLLogger sharedInstance]];
    
    // 增加FILE日志
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24 * 7;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 10;
    [DDLog addLogger:fileLogger];
    
}

+ (NSString *)getLogsDirectory {
    DDFileLogger *filelogger = [[DDFileLogger alloc] init];
    // 获得log文件夹路径
    NSString *logDirectory = [filelogger.logFileManager logsDirectory];
    return logDirectory;
}
+ (NSArray<NSString *> *)getLogsNames {
    DDFileLogger *filelogger = [[DDFileLogger alloc] init];
    // 获得排序后的log名称
    NSArray <NSString *> *logsNameArray = [filelogger.logFileManager sortedLogFileNames];
    return logsNameArray;
}

@end
