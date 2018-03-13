//
//  WebViewVC.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/6.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "WebViewVC.h"
#import "UIWebView+AccessoryHiding.h"

@interface WebViewVC ()

@end

@implementation WebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.hackishlyHidesInputAccessoryView = YES;
    [webView loadHTMLString:@"\
     <html>\
        <head></head>\
        <body>\
     <video src=\"http://www.baidu.com\" controls=\"controls\">\
            您的浏览器不支持video标签\
            </video>\
        </body>\
     </html>\
     " baseURL:nil];
    [self.view addSubview:webView];
    // Do any additional setup after loading the view.
}

@end
