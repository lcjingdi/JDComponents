//
//  JDCustomFormatter.m
//  JDComponents
//
//  Created by lcjingdi on 2018/1/18.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "JDCustomFormatter.h"


@interface JDCustomFormatter()
@end
@implementation JDCustomFormatter
/// 自定义显示的样式
- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel;
    switch (logMessage->_flag) {
        case DDLogFlagError    : logLevel = @"Error"; break;
        case DDLogFlagWarning  : logLevel = @"Warning"; break;
        case DDLogFlagInfo     : logLevel = @"Info"; break;
        case DDLogFlagDebug    : logLevel = @"Debug"; break;
        default                : logLevel = @"Verbose"; break;
    }
    return [NSString stringWithFormat:@"【%@】>>> %@", logLevel, logMessage->_message];
}
@end
