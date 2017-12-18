//
//  ARefomer.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/15.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "ARefomer.h"
#import "ABusinessManager.h"
#import "BBusinessManager.h"

NSString * const kReformerDataKeytTitle = @"kReformerDataKeytTitle";
NSString * const kReformerDataKeytImages = @"kReformerDataKeytImages";

@implementation ARefomer
- (NSDictionary *_Nonnull)reformData:(NSDictionary *_Nonnull)originData WithManager:(nullable id)manager {
    NSDictionary *resultData = nil;
    if ([manager isKindOfClass:[ABusinessManager class]]) {
        resultData = @{
                       kReformerDataKeytTitle: originData[@"title"],
                       kReformerDataKeytImages: originData[@"images"]
                       };
    } else if ([manager isKindOfClass:[BBusinessManager class]]) {
        NSDictionary *dict = originData[@"data"];
        resultData = @{
                       kReformerDataKeytTitle: dict[@"title"],
                       kReformerDataKeytImages: @[dict[@"images"][@"image1"],dict[@"images"][@"image2"]]
                       };
    }
    return resultData;
}
@end
