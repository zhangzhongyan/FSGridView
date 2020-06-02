//
//  FSStockTextCell.m
//  Example
//
//  Created by 张忠燕 on 2020/5/30.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "FSStockTextCell.h"
//Helper
#import <Masonry/Masonry.h>

@interface FSStockTextCell ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation FSStockTextCell

#pragma mark - Initialize Methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
        [self setupConstraints];
        [self setupBinding];
    }
    return self;
}

#pragma mark - Public Methods

/// 高度
+ (CGFloat)cellHeight
{
    return 44.0f;
}

#pragma mark - Private Methods

- (void)setupSubviews
{
    self.backgroundColor = UIColor.whiteColor;
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.lineView];
}

- (void)setupConstraints
{
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.equalTo(@(1.0f));
    }];
}

- (void)setupBinding
{
    
}

#pragma mark - property

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = UIColor.clearColor;
        _label.textColor = UIColor.blackColor;
    }
    return _label;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:237/255.0 green:242/255.0 blue:245/255.0 alpha:1.0];
    }
    return _lineView;
}

@end

