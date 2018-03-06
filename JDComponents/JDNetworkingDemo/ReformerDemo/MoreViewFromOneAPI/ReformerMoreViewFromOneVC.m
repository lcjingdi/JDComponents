//
//  ReformerMoreViewFromOneVC.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/6.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "ReformerMoreViewFromOneVC.h"
#import <HandyFrame/UIView+LayoutMethods.h>
#import "VerticalScreenView.h"
#import "HorizontalScreenView.h"

@interface ReformerMoreViewFromOneVC ()
// 竖屏View
@property (nonatomic, strong) VerticalScreenView  *verticalScreenView;
// 横屏View
@property (nonatomic, strong) HorizontalScreenView  *horizontalScreenView;
@end

@implementation ReformerMoreViewFromOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.horizontalScreenView];
    
    self.navigationController.navigationBar.translucent = NO;
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self _shouldRotateToOrientation:(UIDeviceOrientation)[UIApplication sharedApplication].statusBarOrientation];
    
}
-(void)_shouldRotateToOrientation:(UIDeviceOrientation)orientation {
    if (orientation == UIDeviceOrientationPortrait ||orientation ==
        UIDeviceOrientationPortraitUpsideDown) { // 竖屏
        [self.horizontalScreenView removeFromSuperview];
        [self.view addSubview:self.verticalScreenView];
        [self.verticalScreenView setNeedsLayout];
        [self.verticalScreenView fill];
    } else { // 横屏
        [self.verticalScreenView removeFromSuperview];
        [self.view addSubview:self.horizontalScreenView];
        [self.horizontalScreenView setNeedsLayout];
        [self.horizontalScreenView fill];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.verticalScreenView fill];
    [self.horizontalScreenView fill];
}

- (VerticalScreenView *)verticalScreenView{
    if (_verticalScreenView == nil) {
        _verticalScreenView = [[VerticalScreenView alloc] init];
    }
    return _verticalScreenView;
}
- (HorizontalScreenView *)horizontalScreenView {
    if (_horizontalScreenView == nil) {
        _horizontalScreenView = [[HorizontalScreenView alloc] init];
    }
    return _horizontalScreenView;
}
@end
