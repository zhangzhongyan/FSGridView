//
//  FSGridViewCell.m
//  FSGridView
//
//  Created by 张忠燕 on 2020/5/28.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "FSGridViewCell.h"

@interface FSGridViewCell ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/// 左侧滚动视图
@property (nonatomic, strong) UICollectionView *leftCollectionView;

/// 右侧滚动视图
@property (nonatomic, strong) UICollectionView *rightCollectionView;

@property (nonatomic, strong) UICollectionViewFlowLayout *leftLayout;

@property (nonatomic, strong) UICollectionViewFlowLayout *rightLayout;

@end

@implementation FSGridViewCell

#pragma mark - Initialize Methods

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dataSource:(id<FSGridViewCellDataSource>)dataSource
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.dataSource = dataSource;
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
    self.backgroundColor = UIColor.clearColor;
    
    CGFloat leftWidth = 0.0f;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewCell:widthForColumn:)]) {
        leftWidth = [self.dataSource gridViewCell:self widthForColumn:0];
    }
    
    self.leftCollectionView.frame = CGRectMake(0.0f, 0.0f, leftWidth, self.frame.size.height);
    self.rightCollectionView.frame = CGRectMake(leftWidth, 0.0f, self.frame.size.width - leftWidth, self.frame.size.height);
}

#pragma mark - Private Methods

- (void)setupSubviews
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.leftCollectionView];
    [self addSubview:self.rightCollectionView];
}

- (void)setupConstraints
{
    
}

- (void)setupBinding
{
    
}

#pragma mark - <UIScrollViewDelate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewCell:didScroll:)]) {
        [self.dataSource gridViewCell:self didScroll:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewCell:didEndDecelerating:)]) {
        [self.dataSource gridViewCell:self didEndDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewCell:scrollViewDidEndDragging:willDecelerate:)]) {
        [self.dataSource gridViewCell:self scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = 0;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfColumnsInCell:)]) {
        count = [self.dataSource numberOfColumnsInCell:self];
    }

    if (collectionView == self.leftCollectionView) {
        return (count > 0)? 1: 0;
    } else {
        return count - 1;
    }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.leftCollectionView) {
        UICollectionViewCell *cell = nil;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewCell:cellForColumn:)]) {
            cell = [self.dataSource gridViewCell:self cellForColumn:0];
        }
        return cell;
    } else {
        NSInteger column = indexPath.row;
        UICollectionViewCell *cell = nil;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewCell:cellForColumn:)]) {
            cell = [self.dataSource gridViewCell:self cellForColumn:column + 1];
        }
        return cell;
    }
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//
//}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewCell:didSelectItemAtColumn:)]) {
        
        if (collectionView == self.leftCollectionView) {
            [self.dataSource gridViewCell:self didSelectItemAtColumn:0];
        } else {
            NSInteger column = indexPath.row;
            [self.dataSource gridViewCell:self didSelectItemAtColumn:column + 1];
        }
    }
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.leftCollectionView) {
        CGFloat leftWidth = 0.0f;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewCell:widthForColumn:)]) {
            leftWidth = [self.dataSource gridViewCell:self widthForColumn:0];
        }
        return CGSizeMake(leftWidth, self.frame.size.height);
    } else {
        
        CGFloat width = 0.0f;
        NSInteger column = indexPath.row;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewCell:widthForColumn:)]) {
            width = [self.dataSource gridViewCell:self widthForColumn:column + 1];
        }
        return CGSizeMake(width, self.frame.size.height);
        
    }
}


#pragma mark - property

- (UICollectionView *)leftCollectionView {
    if (!_leftCollectionView) {
        _leftCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.leftLayout];
        _leftCollectionView.backgroundColor = UIColor.clearColor;
        _leftCollectionView.showsHorizontalScrollIndicator = NO;
        _leftCollectionView.delegate = self;
        _leftCollectionView.dataSource = self;
        _leftCollectionView.scrollEnabled = NO;
    }
    return _leftCollectionView;
}

- (UICollectionView *)rightCollectionView {
    if (!_rightCollectionView) {
        _rightCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.rightLayout];
        _rightCollectionView.backgroundColor = UIColor.clearColor;
        _rightCollectionView.showsHorizontalScrollIndicator = NO;
        _rightCollectionView.delegate = self;
        _rightCollectionView.dataSource = self;
    }
    return _rightCollectionView;
}

- (UICollectionViewFlowLayout *)leftLayout{
    if (!_leftLayout) {
        _leftLayout = [[UICollectionViewFlowLayout alloc] init];
        _leftLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _leftLayout.minimumLineSpacing = 0;
        _leftLayout.minimumInteritemSpacing = 0;
    }
    return _leftLayout;
}

- (UICollectionViewFlowLayout *)rightLayout{
    if (!_rightLayout) {
        _rightLayout = [[UICollectionViewFlowLayout alloc] init];
        _rightLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _rightLayout.minimumLineSpacing = 0;
        _rightLayout.minimumInteritemSpacing = 0;
    }
    return _rightLayout;
}

@end
