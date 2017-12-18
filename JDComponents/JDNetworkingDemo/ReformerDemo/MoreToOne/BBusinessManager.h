//
//  BBusinessManager.h
//  JDComponents
//
//  Created by lcjingdi on 2017/12/14.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "ReformerProtocol.h"

@interface BBusinessManager : YTKBaseRequest
- (NSDictionary *_Nullable)fetchBussinessDataWithReformer:(nullable id<ReformerProtocol>)reformer;
@end
