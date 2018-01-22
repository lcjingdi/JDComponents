//
//  PersonModel.h
//  JDComponents
//
//  Created by lcjingdi on 2018/1/22.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentModel.h"

typedef enum : NSUInteger {
    SexMale,
    SexFemale
} Sex;

@interface PersonModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (assign, nonatomic) unsigned int age;
@property (copy, nonatomic) NSString *height;
@property (strong, nonatomic) NSNumber *money;
@property (assign, nonatomic) Sex sex;
@property (assign, nonatomic, getter=isGay) BOOL gay;
@property (nonatomic, strong) StudentModel  *stuModel;
@property (nonatomic, strong) NSArray  *girls;

@end
