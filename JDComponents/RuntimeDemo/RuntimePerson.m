//
//  RuntimePerson.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/6.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "RuntimePerson.h"

@interface RuntimePerson()
@property (nonatomic, copy) NSString  *age;
@end

@implementation RuntimePerson
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.age = @"18";
        self.name = @"jingdi";
    }
    return self;
}
- (void)sayHello {
    NSLog(@"hello ,my age is %@",self.age);
}
- (void)interface {
    NSLog(@"I'm %@",self.name);
}
- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@,age:%@",self.name,self.age];
}
@end
