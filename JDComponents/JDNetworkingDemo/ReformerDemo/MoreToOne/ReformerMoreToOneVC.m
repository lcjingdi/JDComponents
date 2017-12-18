//
//  ReformerMoreToOneVC.m
//  JDComponents
//
//  Created by lcjingdi on 2017/12/14.
//  Copyright © 2017年 lcjingdi. All rights reserved.
//

#import "ReformerMoreToOneVC.h"
#import <HandyFrame/UIView+LayoutMethods.h>

#import "ReformerKeys.h"
#import "ABusinessManager.h"
#import "BBusinessManager.h"
#import "ARefomer.h"

@interface ReformerMoreToOneVC ()
@property (nonatomic, strong) UIButton  *abutton;
@property (nonatomic, strong) UIButton  *bbutton;

@property (nonatomic, strong) UIView  *cView;
@property (nonatomic, strong) UILabel  *cTitle;
@property (nonatomic, strong) UIImageView  *cImageView1;
@property (nonatomic, strong) UIImageView  *cImageView2;

@property (nonatomic, strong) ABusinessManager  *amanager;
@property (nonatomic, strong) BBusinessManager  *bmanager;
@property (nonatomic, strong) ARefomer  *reformer;

@end

@implementation ReformerMoreToOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    
    [self.view addSubview:self.abutton];
    [self.view addSubview:self.bbutton];
    [self.view addSubview:self.cView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.cView.ct_width = self.view.ct_width;
    self.cView.ct_top = self.abutton.ct_bottom;
    self.cView.ct_height = self.view.ct_height - self.abutton.ct_height -20;
    
    self.cTitle.ct_top = self.cView.ct_top;
    self.cTitle.ct_left = self.cView.ct_left;
    self.cTitle.ct_width = self.cView.ct_width;
    self.cTitle.ct_height = 40;
    
    self.cImageView1.ct_left = self.cView.ct_left;
    self.cImageView1.ct_top = self.cTitle.ct_top + 40;
    self.cImageView1.ct_width = self.cView.ct_width ;
    self.cImageView1.ct_height = (self.cView.ct_height-40) * 0.5;
    
    
    self.cImageView2.ct_top = self.cImageView1.ct_bottom;
    self.cImageView2.ct_width = self.cView.ct_width;
    self.cImageView2.ct_height = (self.cView.ct_height-40) * 0.5;
    self.cImageView2.ct_left = self.cView.ct_left;
}
- (void)abussinessAction {
    [self acceptDataShowView:[self.amanager fetchBussinessDataWithReformer:self.reformer]];
}
- (void)acceptDataShowView:(NSDictionary *)dict {
    self.cImageView1.image = [UIImage imageNamed:dict[kReformerDataKeytImages][0]];
    self.cImageView2.image = [UIImage imageNamed:dict[kReformerDataKeytImages][1]];
    self.cTitle.text = dict[kReformerDataKeytTitle];
}
- (void)bbussinessAction {
    [self acceptDataShowView:[self.bmanager fetchBussinessDataWithReformer:self.reformer]];
}
- (UIButton *)abutton {
    if (_abutton == nil) {
        _abutton = [[UIButton alloc] init];
        [_abutton setTitle:@"ABussiness" forState:UIControlStateNormal];
        [_abutton addTarget:self action:@selector(abussinessAction) forControlEvents:UIControlEventTouchUpInside];
        [_abutton fromTheTop:-20 ofView:self.view];
        [_abutton fromTheLeft:-20 ofView:self.view];
        _abutton.ct_width = 100;
        _abutton.ct_height = 50;
        _abutton.backgroundColor = [UIColor redColor];
    }
    return _abutton;
}
- (UIButton *)bbutton {
    if (_bbutton == nil) {
        _bbutton = [[UIButton alloc] init];
        [_bbutton setTitle:@"BBussiness" forState:UIControlStateNormal];
        [_bbutton addTarget:self action:@selector(bbussinessAction) forControlEvents:UIControlEventTouchUpInside];
        [_bbutton fromTheTop:-20 ofView:self.view];
        [_bbutton fromTheRight:-120 ofView:self.view];
        _bbutton.ct_height = 50;
        _bbutton.ct_width = 100;
        _bbutton.backgroundColor = [UIColor blueColor];
    }
    return _bbutton;
}
- (UIView *)cView {
    if (_cView == nil) {
        _cView = [[UIView alloc] init];
        [_cView addSubview:self.cTitle];
        [_cView addSubview:self.cImageView1];
        [_cView addSubview:self.cImageView2];
    }
    return _cView;
}
- (UILabel *)cTitle {
    if (_cTitle == nil) {
        _cTitle = [[UILabel alloc] init];
        _cTitle.textAlignment = NSTextAlignmentCenter;
        _cTitle.textColor = [UIColor blackColor];
        [_cTitle setText:@"模版代码"];
    }
    return _cTitle;
}
- (UIImageView *)cImageView1 {
    if (_cImageView1 == nil) {
        _cImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meinv1"]];
        _cImageView1.backgroundColor = [UIColor lightGrayColor];
        _cImageView1.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _cImageView1;
}
- (UIImageView *)cImageView2 {
    if (_cImageView2 == nil) {
        _cImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meinv2"]];
        _cImageView2.backgroundColor = [UIColor darkGrayColor];
        _cImageView2.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _cImageView2;
}

- (ABusinessManager *)amanager {
    if (_amanager == nil) {
        _amanager = [[ABusinessManager alloc] init];
    }
    return _amanager;
}
- (BBusinessManager *)bmanager {
    if (_bmanager == nil) {
        _bmanager = [[BBusinessManager alloc] init];
    }
    return _bmanager;
}
- (ARefomer *)reformer {
    if (_reformer == nil) {
        _reformer = [[ARefomer alloc] init];
    }
    return _reformer;
}
@end
