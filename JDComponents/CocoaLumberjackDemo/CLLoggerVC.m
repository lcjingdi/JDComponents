//
//  CLLoggerVC.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/19.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "CLLoggerVC.h"
#import "JDLog.h"

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

    // 布局界面
    [self setupUI];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    DDLogVerbose(@"directory:%@",[JDLog getLogsDirectory]);
    DDLogError(@"names:%@",[JDLog getLogsNames]);
}

#pragma mark - private method
/// 界面布局
- (void)setupUI {
    UISwitch *switchButton = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [switchButton addTarget:self action:@selector(changeLevel:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchButton];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [button setTitle:@"上传日志" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(updateFiles) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
/// 上传日志
- (void)updateFiles {
    DDLogVerbose(@"directory:%@",[JDLog getLogsDirectory]);
    DDLogError(@"names:%@",[JDLog getLogsNames]);
}
/// 日志的打开和关闭
- (void)changeLevel:(UISwitch *)switchButton {
    if (switchButton.isOn) {
        s_ddLogLevel = DDLogLevelVerbose;
    } else {
        s_ddLogLevel = DDLogLevelError;
    }
}
@end
