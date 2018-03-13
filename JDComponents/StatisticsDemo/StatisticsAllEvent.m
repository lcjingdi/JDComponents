//
//  StatisticsAllEvent.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/13.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "StatisticsAllEvent.h"
#import "StatisticsVC.h"
#import <Aspects/Aspects.h>
#import <objc/runtime.h>

@implementation StatisticsAllEvent
static id _instance;
+ (instancetype)sharedInstance {
    @synchronized(self){
        if(_instance == nil){
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}
- (void)statistics {
    __weak typeof(self) ws = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statistics" ofType:@"plist"];
        NSDictionary *eventStatisticsDict = [[NSDictionary alloc] initWithContentsOfFile:path];
        for (NSString *classNameString in eventStatisticsDict.allKeys) {
            //使用运行时创建类对象
            const char * className = [classNameString UTF8String];
            //从一个字串返回一个类
            Class newClass = objc_getClass(className);
            NSArray *pageEventList = [eventStatisticsDict objectForKey:classNameString];
            for (NSDictionary *eventDict in pageEventList) {
                //事件方法名称
                NSString *eventMethodName = eventDict[@"MethodName"];
                SEL seletor = NSSelectorFromString(eventMethodName);
                
                NSString *eventId = eventDict[@"EventId"];
                
                [ws trackEventWithClass:newClass selector:seletor event:eventId];
            }
        }
    });
}
- (void)start {
    [self statistics];
}
- (void)trackEventWithClass:(Class)klass selector:(SEL)selector event:(NSString *)event
{
    [klass aspect_hookSelector:selector withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        NSLog(@"eventId:%@, properties:%@",event,aspectInfo);
    } error:NULL];
}
@end
