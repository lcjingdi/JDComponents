//
//  V2Reformer.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/18.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "V2Reformer.h"
#import "VBusinessManager.h"

NSString * const kReformerDataKeyV2Title = @"kReformerDataKeyV2Title";
NSString * const kReformerDataKeyV2DetailTitle = @"kReformerDataKeyV2DetailTitle";
NSString * const kReformerDataKeyV2Image = @"kReformerDataKeyV2Image";

@implementation V2Reformer
- (NSDictionary *_Nonnull)reformData:(NSDictionary *_Nonnull)originData WithManager:(nullable id)manager {
    NSDictionary *resultData = nil;
    if ([manager isKindOfClass:[VBusinessManager class]]) {
        NSArray *array = originData[@"data"];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            [arrayM addObject:@{
                                kReformerDataKeyV2DetailTitle:dict[@"detailTitle"],
                                kReformerDataKeyV2Title:dict[@"title"],
                                kReformerDataKeyV2Image: dict[@"imageName"]
                                }];
        }
        resultData = @{@"key":[arrayM copy]};
    }
    return resultData;
}
@end
