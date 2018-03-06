//
//  VerticalScreenView.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/6.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "VerticalScreenView.h"
#import <HandyFrame/UIView+LayoutMethods.h>

@interface VerticalScreenView()
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UIImageView  *contentImageView;
@property (nonatomic, strong) UILabel  *bottomTitleLabel;
@end

@implementation VerticalScreenView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.contentImageView];
        [self addSubview:self.bottomTitleLabel];
        
        self.titleLabel.text = @"VerticalScreenView";
        self.bottomTitleLabel.text = @"VerticalScreenView_Bottom";
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.ct_top = self.ct_top;
    [self.titleLabel fillWidth];
    
    self.contentImageView.ct_top = self.titleLabel.ct_bottom + 20;
    [self.contentImageView fillWidth];
    self.contentImageView.ct_height = 200;
    self.contentImageView.ct_centerX = self.titleLabel.ct_centerX;
    
    self.bottomTitleLabel.ct_top = self.contentImageView.ct_bottom + 20;
    [self.bottomTitleLabel fillWidth];
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.ct_height = 100;
    }
    return _titleLabel;
}
- (UILabel *)bottomTitleLabel {
    if (_bottomTitleLabel == nil) {
        _bottomTitleLabel = [[UILabel alloc] init];
        _bottomTitleLabel.textColor = [UIColor redColor];
        _bottomTitleLabel.textAlignment = NSTextAlignmentCenter;
        _bottomTitleLabel.ct_height = 100;
    }
    return _bottomTitleLabel;
}
- (UIImageView *)contentImageView {
    if (_contentImageView == nil) {
        _contentImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meinv1"]];
    }
    return _contentImageView;
}

@end
