//
//  VBusinessManager.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/18.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "VBusinessManager.h"

@interface VBusinessManager()
@property (nonatomic, strong) NSDictionary *rawData;
@end

@implementation VBusinessManager

- (NSDictionary *_Nullable)fetchBussinessDataWithReformer:(nullable id<ReformerProtocol>)reformer {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"plist"];
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
