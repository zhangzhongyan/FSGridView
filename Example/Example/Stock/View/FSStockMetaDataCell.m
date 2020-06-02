//
//  FSStockMetaDataCell.m
//  Example
//
//  Created by 张忠燕 on 2020/5/30.
//  Copyright © 2020 张忠燕. All rights reserved.
//

//View
#import "FSStockMetaDataCell.h"
//Helper
#import <Masonry.h>

@interface FSStockMetaDataCell ()

/// 名称Label
@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *bottomLabel1;

@property (nonatomic, strong) UILabel *bottomLabel2;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation FSStockMetaDataCell

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

- (void)setContentWithCellVM:(FSStockCellViewModel *)cellVM
{
    self.nameLabel.text = cellVM.model.name.length? cellVM.model.name: @"--";
    
    if (cellVM.model.leveragable.boolValue) {
        self.bottomLabel1.font = [UIFont systemFontOfSize:12.0f];
        self.bottomLabel1.text = @"融";
        self.bottomLabel1.backgroundColor = UIColor.orangeColor;
        
        self.bottomLabel2.text = cellVM.model.codeNumber.length? cellVM.model.codeNumber: @"--";
    } else {
        self.bottomLabel1.font = [UIFont systemFontOfSize:15.0f];
        self.bottomLabel1.text = cellVM.model.codeNumber.length? cellVM.model.codeNumber: @"--";
        self.bottomLabel1.backgroundColor = UIColor.whiteColor;
        
        self.bottomLabel2.text = nil;
    }
}

/// 宽度
+ (CGFloat)cellWidth
{
    return 100.0f;
}

/// 高度
+ (CGFloat)cellHeight
{
    return 44.0f;
}

#pragma mark - Private Methods

- (void)setupSubviews
{
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.bottomLabel1];
    [self.contentView addSubview:self.bottomLabel2];
    [self.contentView addSubview:self.lineView];
}

- (void)setupConstraints
{
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15.0f);
        make.centerY.equalTo(self.contentView).offset(-10.0f);
    }];
    
    [self.bottomLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15.0f);
        make.centerY.equalTo(self.contentView).offset(10.0f);
    }];
    
    [self.bottomLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomLabel1.mas_right).offset(5.0f);
        make.centerY.equalTo(self.bottomLabel1);
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

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.backgroundColor = UIColor.clearColor;
        _nameLabel.textColor = UIColor.blackColor;
    }
    return _nameLabel;
}

- (UILabel *)bottomLabel1 {
    if (!_bottomLabel1) {
        _bottomLabel1 = [[UILabel alloc] init];
        _bottomLabel1.textAlignment = NSTextAlignmentCenter;
        _bottomLabel1.backgroundColor = UIColor.clearColor;
        _bottomLabel1.textColor = UIColor.blackColor;
    }
    return _bottomLabel1;
}

- (UILabel *)bottomLabel2 {
    if (!_bottomLabel2) {
        _bottomLabel2 = [[UILabel alloc] init];
        _bottomLabel2.textAlignment = NSTextAlignmentCenter;
        _bottomLabel2.backgroundColor = UIColor.clearColor;
        _bottomLabel2.textColor = UIColor.blackColor;
    }
    return _bottomLabel2;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:237/255.0 green:242/255.0 blue:245/255.0 alpha:1.0];
    }
    return _lineView;
}

@end

