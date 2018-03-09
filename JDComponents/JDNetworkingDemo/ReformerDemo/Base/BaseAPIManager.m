//
//  BaseAPIManager.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/6.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "BaseAPIManager.h"

@interface BaseAPIManager()
@property (nonatomic, weak) id<APIManager> child;
@end

@implementation BaseAPIManager
- (instancetype)init {
    self = [super init];
    
    if ([self conformsToProtocol:@protocol(APIManager)]) {
        self.child = (id<APIManager>)self;
    } else {
        NSAssert(NO, @"子类必须要实现APIManager这个protocol");
    }
 
    return self;
}
@end
