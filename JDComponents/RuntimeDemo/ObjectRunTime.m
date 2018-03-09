//
//  ObjectRunTime.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/6.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "ObjectRunTime.h"
#import <objc/runtime.h>

@implementation ObjectRunTime
- (NSDictionary *)cf_KeysWithValues {
    unsigned int count ,i;
    objc_property_t *propertyArray = class_copyPropertyList([self class], &count);
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    for (i = 0; i < count; i++) {
        objc_property_t property = propertyArray[i];
        NSString *proKey = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        id proValue = [self valueForKey:proKey];
        
        if (proValue) {
            [dic setObject:proValue forKey:proKey];
        } else {
            [dic setObject:@"" forKey:proKey];
        }
    }
    free(propertyArray);
    return dic;
}
@end
