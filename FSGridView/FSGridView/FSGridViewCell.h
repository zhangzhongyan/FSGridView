//
//  FSGridViewCell.h
//  FSGridView
//
//  Created by 张忠燕 on 2020/5/28.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FSGridViewCell;
@protocol FSGridViewCellDataSource <NSObject>

/// 多少列
/// @param cell 视图
- (NSInteger)numberOfColumnsInCell:(FSGridViewCell *)cell;

/// 列宽
/// @param cell 视图
- (CGFloat)gridViewCell:(FSGridViewCell *)cell widthForColumn:(NSInteger)column;

/// 返回对应的单元
/// @param cell 视图
/// @param column 列位置
- (UICollectionViewCell *)gridViewCell:(FSGridViewCell *)cell cellForColumn:(NSInteger)column;

/// 点击对应的单元
/// @param cell 视图
/// @param column 列位置
- (void)gridViewCell:(FSGridViewCell *)cell collectionCell:(nullable UICollectionViewCell *)collectionCell didSelectItemAtColumn:(NSInteger)column;
 
/// 滚动回调
/// @param cell cell视图
/// @param scrollView 滚动视图
- (void)gridViewCell:(FSGridViewCell *)cell didScroll:(UIScrollView *)scrollView;

/// 滚动回调
/// @param cell cell视图
/// @param scrollView 滚动视图
- (void)gridViewCell:(FSGridViewCell *)cell didEndDecelerating:(UIScrollView *)scrollView;

/// 滚动回调
/// @param cell cell视图
/// @param scrollView 滚动视图
/// @param decelera 是否将要减速
- (void)gridViewCell:(FSGridViewCell *)cell scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelera;

@end

/// 网格Cell
@interface FSGridViewCell : UITableViewCell<UICollectionViewDelegate>

/// 数据源
@property (nonatomic, weak) id<FSGridViewCellDataSource> dataSource;

/// 左侧滚动视图
@property (nonatomic, strong, readonly) UICollectionView *leftCollectionView;

/// 右侧滚动视图
@property (nonatomic, strong, readonly) UICollectionView *rightCollectionView;

/// 网格所在行
@property (nonatomic, assign) NSInteger gridRowIndex;

/// 指定构造方法
/// @param style 款式
/// @param reuseIdentifier 重用标识
/// @param dataSource 数据源
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(nullable NSString *)reuseIdentifier
                   dataSource:(nullable id<FSGridViewCellDataSource>)dataSource;
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(nullable NSString *)reuseIdentifier NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
