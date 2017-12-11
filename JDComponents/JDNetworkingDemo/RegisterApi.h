//
//  RegisterApi.h
//  JDComponents
//
//  Created by lcjingdi on 2017/12/11.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

@interface RegisterApi : YTKRequest

- (id)initWithUsername:(NSString *)username password:(NSString *)password;

@end
