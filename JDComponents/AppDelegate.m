//
//  AppDelegate.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/11.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "AppDelegate.h"
#import "Felix.h"
#import "StatisticsAllEvent.h"
#import <Aspects/Aspects.h>

@interface AppDelegate ()
@property (nonatomic, strong) StatisticsAllEvent  *all;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self fixBugs];
//    [[StatisticsAllEvent sharedInstance] start];
    
    [self setupApperance];
    
    return YES;
}

- (void)fixBugs {
    [Felix fixIt];
    NSString *fixScriptString2 = @" \
    fixInstanceMethodReplace('HotFixVC', 'viewWillAppear:', function(instance, originInvocation, originArguments){ \
    super.originInvocation(originArguments);\
    }); \
    ";
    [Felix evalString:fixScriptString2];
}

- (void)setupApperance {
    [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
        if ([aspectInfo.instance isKindOfClass:[UIViewController class]]) {
            ((UIViewController *)aspectInfo.instance).view.backgroundColor = [UIColor whiteColor];
        }
    } error:NULL];
}
@end
