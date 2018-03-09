//
//  ObjectRunTime.h
//  JDComponents
//
//  Created by lcjingdi on 2018/3/6.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectRunTime : NSObject
@property(nonatomic,copy)NSString   *name;
@property(nonatomic,copy)NSString   *age;
@property(nonatomic,assign)BOOL     sex;
@property(nonatomic,strong)NSArray  *arrayFamlily;

- (NSDictionary *)cf_KeysWithValues;
@end
