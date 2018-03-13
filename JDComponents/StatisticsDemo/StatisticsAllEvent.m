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
                NSArray *params = eventDict[@"Params"];
                [ws trackEventWithClass:newClass selector:seletor event:eventId params:params];
            }
        }
    });
}
- (void)start {
    [self statistics];
//    NSLog(@"AAA:开始获取类列表");
    int count = 0;
//    int numClasses = 0, newNumClasses = objc_getClassList(NULL, 0);
//    Class *classes = NULL;
//    while (numClasses < newNumClasses) {
//        numClasses = newNumClasses;
//        classes = (Class *)realloc(classes, sizeof(Class) * numClasses);
//        newNumClasses = objc_getClassList(classes, numClasses);
//        for (int i = 0; i < numClasses; i++) {
//            const char *className = class_getName(classes[i]);
//            NSString *OCString =[NSString stringWithCString:className encoding:NSUTF8StringEncoding];
//            if ([OCString hasPrefix:@"NS"] || [OCString hasPrefix:@"UI"]) {
//                continue;
//            }
//            count++;
//            NSLog(@"%s", className);
//        }
//    }
//    free(classes);
//    NSLog(@"AAA:方法一类列表获取完毕,总个数:%d",count);
    
    NSLog(@"方法二:");
    unsigned int outCount;
    count = 0;
    Class *classes2 = objc_copyClassList(&outCount);
    for (int i = 0; i < outCount; i++) {
        const char *className = class_getName(classes2[i]);
        NSString *OCString =[NSString stringWithCString:className encoding:NSUTF8StringEncoding];
        if ([OCString hasPrefix:@"NS"] || [OCString hasPrefix:@"UI"] || [OCString hasPrefix:@"Foundation"] || [OCString hasPrefix:@"_"] || [OCString hasPrefix:@"Swift"] || [OCString hasPrefix:@"CT"] || [OCString hasPrefix:@"OS"] || [OCString hasPrefix:@"CA"] || [OCString hasPrefix:@"UN"] ||[OCString hasPrefix:@"AV"] || [OCString hasPrefix:@"Web"]) {
            continue;
        }
        count++;
        NSLog(@"%s",class_getName(classes2[i]));
        NSLog(@"AAA:开始获取方法列表");
        
        unsigned int methodCount = 0;
        Method * methods = class_copyMethodList(NSClassFromString([NSString stringWithCString:class_getName(classes2[i]) encoding:NSUTF8StringEncoding]), &methodCount);
        for(int i=0;i<methodCount  ;i++)
        {
            Method method = methods[i];
            SEL methodsel = method_getName(method);
            const char * name = sel_getName(methodsel);
            NSString *MethodString =[NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            if ([MethodString hasPrefix:@"_"]) {
                continue;
            }
            NSLog(@"----------------方法为：%s",name);
        }
        NSLog(@"AAA:方法列表获取完毕");
    }
    NSLog(@"AAA:方法二类列表获取完毕,总个数:%d",count);
    
    
}
- (void)trackEventWithClass:(Class)klass selector:(SEL)selector event:(NSString *)event params:(NSArray *)params
{
    [klass aspect_hookSelector:selector withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        NSLog(@"eventId:%@, params:%@",event,params);
    } error:NULL];
}
@end
