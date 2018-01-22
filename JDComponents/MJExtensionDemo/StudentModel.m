//
//  StudentModel.m
//  JDComponents
//
//  Created by lcjingdi on 2018/1/22.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "StudentModel.h"
#import <MJExtension/MJExtension.h>

@implementation StudentModel
- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@, height: %@",self.name,self.height];
}
MJExtensionCodingImplementation
@end
