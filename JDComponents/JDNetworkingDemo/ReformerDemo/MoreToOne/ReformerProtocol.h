//
//  ReformerProtocol.h
//  JDComponents
//
//  Created by lcjingdi on 2017/12/14.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#ifndef ReformerProtocol_h
#define ReformerProtocol_h

#import <Foundation/Foundation.h>

@protocol ReformerProtocol <NSObject>
- (NSDictionary *_Nonnull)reformData:(NSDictionary *_Nonnull)originData WithManager:(nullable id)manager;
@end

#endif /* ReformerProtocol_h */
