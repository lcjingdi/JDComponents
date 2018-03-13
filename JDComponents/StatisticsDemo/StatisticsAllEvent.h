//
//  StatisticsAllEvent.h
//  JDComponents
//
//  Created by lcjingdi on 2018/3/13.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatisticsAllEvent : NSObject
+ (instancetype)sharedInstance;
- (void)start;
@end
