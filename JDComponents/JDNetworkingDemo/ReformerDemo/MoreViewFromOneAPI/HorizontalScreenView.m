//
//  HorizontalScreenView.m
//  JDComponents
//
//  Created by lcjingdi on 2018/3/6.
//  Copyright © 2018年 lcjingdi. All rights reserved.
//

#import "HorizontalScreenView.h"
#import <HandyFrame/UIView+LayoutMethods.h>


@interface HorizontalScreenView()
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UIImageView  *contentImageView;
@end

@implementation HorizontalScreenView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.contentImageView];

        self.titleLabel.text = @"HorizontalScreenView";
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.ct_width = self.ct_width * 0.5;
    self.titleLabel.ct_centerY = self.ct_centerY;
    
    self.contentImageView.ct_top = self.ct_top;
    self.contentImageView.ct_left = self.titleLabel.ct_right;
    [self.contentImageView fillHeight];
    self.contentImageView.ct_width = self.ct_width * 0.5;
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

- (UIImageView *)contentImageView {
    if (_contentImageView == nil) {
        _contentImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meinv1"]];
    }
    return _contentImageView;
}

@end
