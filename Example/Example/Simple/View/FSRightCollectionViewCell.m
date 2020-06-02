//
//  FSRightCollectionViewCell.m
//  FSGridView
//
//  Created by 张忠燕 on 2020/5/29.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "FSRightCollectionViewCell.h"

@interface FSRightCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation FSRightCollectionViewCell

#pragma mark - Initialize Methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.orangeColor;
        [self setupSubviews];
        [self setupConstraints];
        [self setupBinding];
    }
    return self;
}

#pragma mark - Overwrite Methods

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.label.frame = self.bounds;
}

#pragma mark - Private Methods

- (void)setupSubviews
{
    [self.contentView addSubview:self.label];
}

- (void)setupConstraints
{
    
}

- (void)setupBinding
{
    
}

#pragma mark - property

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = UIColor.clearColor;
        _label.textColor = UIColor.blackColor;
        _label.text = @"右边";
    }
    return _label;
}


@end
