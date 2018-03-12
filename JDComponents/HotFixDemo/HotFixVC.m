//
//  HotFixVC.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/12.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "HotFixVC.h"
#import <Aspects/Aspects.h>
#import <HandyFrame/UIView+LayoutMethods.h>
#import "Felix.h"
#import "MightyCrash.h"

@interface HotFixVC ()

@end

@implementation HotFixVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 100;
        [button setTitle:@"点我就崩溃了" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button addTarget:self action:@selector(clickCrash) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];

//    [Felix fixIt];
//
//    NSString *fixScriptString = @" \
//    fixInstanceMethodReplace('MightyCrash', 'divideUsingDenominator:', function(instance, originInvocation, originArguments){ \
//    if (originArguments == 0) { \
//    console.log('zero goes here'); \
//    } else { \
//    runInvocation(originInvocation); \
//    } \
//    }); \
//    \
//    ";
//
//    [Felix evalString:fixScriptString];
    
//    [Felix fixIt];
//
//    NSString *fixScriptString2 = @" \
//    fixInstanceMethodReplace('MightyCrash', 'showArray:', function(instance, originInvocation, originArguments){ \
//    if (originArguments[0][0] > 5) { \
//    console.log('大于5');\
//    } else {\
//    console.log('小于5');\
//    }\
//    }); \
//    ";
//
//    [Felix evalString:fixScriptString2];
    
    
}
- (void)clickCrash {
    NSLog(@"clickCrash");
    MightyCrash *mc = [[MightyCrash alloc] init];
    [mc showArray:@[@"1",@"123123123"]];
//    float result = [mc divideUsingDenominator:1];
//    NSLog(@"result: %.3f", result);
//    result = [mc divideUsingDenominator:0];
//    NSLog(@"won't crash");
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIButton *button = (UIButton *)[self.view viewWithTag:100];
    button.frame = CGRectMake(100, 100, 100, 50);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
