//
//  V1Reformer.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/18.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "V1Reformer.h"
#import "VBusinessManager.h"

NSString * const kReformerDataKeyV1Title = @"kReformerDataKeyV1Title";
NSString * const kReformerDataKeyV1Image = @"kReformerDataKeyV1Image";

@implementation V1Reformer
- (NSDictionary *_Nonnull)reformData:(NSDictionary *_Nonnull)originData WithManager:(nullable id)manager {
    NSDictionary *resultData = nil;
    
    if ([manager isKindOfClass:[VBusinessManager class]]) {
        NSDictionary *dict = originData[@"data"][0];
        resultData = @{
                       kReformerDataKeyV1Title: dict[@"title"],
                       kReformerDataKeyV1Image: dict[@"imageName"]
                       };
    }
    return resultData;
}
@end
