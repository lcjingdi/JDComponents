//
//  YTKNetworkingVC.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/11.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "YTKNetworkingVC.h"
#import <HandyFrame/UIView+LayoutMethods.h>
#import "RegisterApi.h"
#import <YTKNetwork/YTKNetwork.h>

@interface YTKNetworkingVC ()

@end

@implementation YTKNetworkingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = @"http://127.0.0.1";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"测试猿题库网络框架";
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] init];
        button.ct_x = 20;
        button.ct_y = 20;
        button.ct_width = 100;
        button.ct_height = 100;
        button.backgroundColor =[UIColor blueColor];
        [button addTarget:self action:@selector(requestPOSTRequest) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
}



- (void)requestPOSTRequest {
    RegisterApi *api1 = [[RegisterApi alloc] initWithUsername:@"333" password:@"123456"];
    RegisterApi *api2 = [[RegisterApi alloc] initWithUsername:@"444" password:@"123456"];
    RegisterApi *api3 = [[RegisterApi alloc] initWithUsername:@"555" password:@"123456"];
    RegisterApi *api4 = [[RegisterApi alloc] initWithUsername:@"123" password:@"123456"];
    YTKBatchRequest *request = [[YTKBatchRequest alloc] initWithRequestArray:@[api1,api2,api3,api4]];
    [request startWithCompletionBlockWithSuccess:^(YTKBatchRequest * _Nonnull batchRequest) {
        NSLog(@"succeed");
        NSArray *requests = batchRequest.requestArray;
        RegisterApi *a = (RegisterApi *)requests[0];
        RegisterApi *b = (RegisterApi *)requests[1];
        RegisterApi *c = (RegisterApi *)requests[2];
        RegisterApi *d = (RegisterApi *)requests[3];
    } failure:^(YTKBatchRequest * _Nonnull batchRequest) {
         NSLog(@"failed");
    }];
}

@end
