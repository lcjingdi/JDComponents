//
//  MightyCrash.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/12.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "MightyCrash.h"

@implementation MightyCrash
// 传一个 0 就 gg 了
- (float)divideUsingDenominator:(NSInteger)denominator
{
    NSLog(@"jjjjjjjjjj");
    return 1.f/denominator;
}

- (void)showArray:(NSArray *)array {
    NSLog(@"showArray:%ld",array.count);
}
@end
