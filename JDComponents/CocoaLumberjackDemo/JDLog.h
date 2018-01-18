//
//  JDLog.h
//  JDComponents
//
//  Created by lcjingdi on 2018/1/18.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//



#ifdef LOG_LEVEL_DEF
    #undef LOG_LEVEL_DEF
#endif
#define LOG_LEVEL_DEF s_ddLogLevel

#import <Foundation/Foundation.h>
#import "CocoaLumberjack.h"

static DDLogLevel s_ddLogLevel = DDLogLevelError;

@interface JDLog : NSObject
/// 获得log的文件夹
+ (NSString *)getLogsDirectory;
/// 获得所有log的名字
+ (NSArray<NSString *> *)getLogsNames;
/// 删除log文件

@end
