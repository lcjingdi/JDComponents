//
//  PersonModel.m
//  JDComponents
//
//  Created by lcjingdi on 2018/1/22.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "PersonModel.h"
// 可以不要这一行 那么类方法：mj_objectClassInArray这个就不需要设置成[GirlModel class]
//#import "GirlModel.h"
#import <MJExtension/MJExtension.h>

@implementation PersonModel

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property {
    if ([property.name isEqualToString:@"name"]) {
        return @"哈哈哈";
    } else if(property.type.class == [NSDate class]){
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"yyyy-MM-dd";
        return [fmt dateFromString:oldValue];
    }
    return oldValue;
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             //[GirlModel class]也可以 但是需要导入类名
             @"girls": @"GirlModel"
             };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@, icon: %@, age: %u, height: %@, money: %@, sex: %lu, gay: %d, stuModel:%@",self.name,self.icon,self.age,self.height,self.money,(unsigned long)self.sex,self.gay,self.stuModel];
}

MJExtensionCodingImplementation
@end
