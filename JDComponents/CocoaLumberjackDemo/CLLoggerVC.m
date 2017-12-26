//
//  CLLoggerVC.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/19.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "CLLoggerVC.h"
#import "CocoaLumberjack.h"

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#endif

@interface CLLoggerVC ()

@end

@implementation CLLoggerVC
- (instancetype)init {
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"日志系统";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置通用参数
    [self setupCocoaLumberJace];
    
}
- (void)setupCocoaLumberJace {
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    
    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
}

@end
