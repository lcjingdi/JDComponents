//
//  StatisticsVC.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/13.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "StatisticsVC.h"
#import <HandyFrame/UIView+LayoutMethods.h>
#import <Aspects/Aspects.h>

@interface StatisticsVC ()
@property (nonatomic, strong) UIButton *tapButton1;
@property (nonatomic, strong) UIButton *tapButton2;
@property (nonatomic, strong) UIButton *tapButton3;
@property (nonatomic, strong) UIButton *tapButton4;
@end

@implementation StatisticsVC
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[[NSClassFromString(@"StatisticsVC2") alloc] init] animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tapButton1];
    [self.view addSubview:self.tapButton2];
    [self.view addSubview:self.tapButton3];
    [self.view addSubview:self.tapButton4];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tapButton1.frame = CGRectMake(100, 100, 100, 44);
    self.tapButton2.frame = CGRectMake(100, 200, 100, 44);
    self.tapButton3.frame = CGRectMake(100, 300, 100, 44);
    self.tapButton4.frame = CGRectMake(100, 400, 100, 44);
}

- (void)tapButton1Click {
    NSLog(@"tapButton1Click");
//    NSLog(@"统计button1点击事件");
}
- (void)tapButton2Click {
    NSLog(@"tapButton2Click");
//    NSLog(@"统计button2点击事件");
}
- (void)tapButton3Click {
    NSLog(@"tapButton3Click");
//    NSLog(@"统计button3点击事件");
}
- (void)tapButton4Click {
    NSLog(@"tapButton4Click");
}
- (UIButton *)tapButton1 {
    if (_tapButton1 == nil) {
        _tapButton1 = [[UIButton alloc] init];
        [_tapButton1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_tapButton1 setTitle:@"_tapButton1" forState:UIControlStateNormal];
        [_tapButton1 addTarget:self action:@selector(tapButton1Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapButton1;
}
- (UIButton *)tapButton2 {
    if (_tapButton2 == nil) {
        _tapButton2 = [[UIButton alloc] init];
        [_tapButton2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_tapButton2 setTitle:@"_tapButton2" forState:UIControlStateNormal];
        [_tapButton2 addTarget:self action:@selector(tapButton2Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapButton2;
}
- (UIButton *)tapButton3 {
    if (_tapButton3 == nil) {
        _tapButton3 = [[UIButton alloc] init];
        [_tapButton3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_tapButton3 setTitle:@"_tapButton3" forState:UIControlStateNormal];
        [_tapButton3 addTarget:self action:@selector(tapButton3Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapButton3;
}
- (UIButton *)tapButton4 {
    if (_tapButton4 == nil) {
        _tapButton4 = [[UIButton alloc] init];
        [_tapButton4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_tapButton4 setTitle:@"_tapButton4" forState:UIControlStateNormal];
        [_tapButton4 addTarget:self action:@selector(tapButton4Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tapButton4;
}
@end
