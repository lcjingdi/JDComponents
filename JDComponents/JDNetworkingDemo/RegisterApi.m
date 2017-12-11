//
//  RegisterApi.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/11.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "RegisterApi.h"

@implementation RegisterApi {
    NSString *_username;
    NSString *_password;
}

- (id)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = username;
        _password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    if ([_username isEqualToString:@"123"]) {
        return @"/rrr.php";
    }
    return @"/register.php";
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}
- (id)requestArgument {
    return @{
             @"username": _username,
             @"password": _password
             };
}
@end
