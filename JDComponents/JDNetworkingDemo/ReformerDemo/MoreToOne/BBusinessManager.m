//
//  BBusinessManager.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/14.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "BBusinessManager.h"

@interface BBusinessManager()
@property (nonatomic, strong) NSDictionary *rawData;
@end

@implementation BBusinessManager
- (NSDictionary *_Nullable)fetchBussinessDataWithReformer:(nullable id<ReformerProtocol>)reformer {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    self.rawData = dict;
    if (reformer == nil) {
        return self.rawData;
    } else {
        return [reformer reformData:self.rawData WithManager:self];
    }
}

- (NSDictionary *)rawData {
    if (_rawData == nil) {
        _rawData = [[NSDictionary alloc] init];
    }
    return _rawData;
}
@end
