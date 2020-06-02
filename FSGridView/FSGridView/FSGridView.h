//
//  FSGridView.h
//  FSGridView
//
//  Created by 张忠燕 on 2020/5/28.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSGridViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@class FSGridView;
@protocol FSGridViewDataSource <NSObject>

/// 多少列
/// @param gridView 网格视图
- (NSInteger)numberOfColumnsInGridView:(FSGridView *)gridView;

/// 多少行
/// @param gridView 网格视图
- (NSInteger)numberOfRowsInGridView:(FSGridView *)gridView;

/// 列宽
/// @param gridView 网格视图
- (CGFloat)gridView:(FSGridView *)gridView widthForColumn:(NSInteger)column;

/// 行高
/// @param gridView 网格视图
- (CGFloat)gridView:(FSGridView *)gridView heightForRow:(NSInteger)row;

/// 固定头部高度
/// @param gridView 网格视图
- (CGFloat)gridViewHeightForHeader:(FSGridView *)gridView;

/// 返回对应的单元（内容区域）
/// @param gridView 网格视图
/// @param girdCell 网格对应的行Cell
/// @param row 行位置
/// @param column 列位置
- (UICollectionViewCell *)gridView:(FSGridView *)gridView cellForRow:(NSInteger)row column:(NSInteger)column inGridCell:(FSGridViewCell *)girdCell;

/// 返回对应的单元（固定头部区域）
/// @param gridView 网格视图
/// @param girdCell 网格对应的行Cell
/// @param column 列位置
- (UICollectionViewCell *)gridView:(FSGridView *)gridView cellForHeaderWithColumn:(NSInteger)column inGridCell:(FSGridViewCell *)girdCell;

@end

@protocol FSGridViewDelegate <NSObject>

/// 点击对应的视图
/// @param gridView 网格视图
/// @param row 对应的行
/// @param column 对应的列
- (void)gridView:(FSGridView *)gridView didSelctedAtRow:(NSInteger)row column:(NSInteger)column;

/// 点击对应的视图（固定头部区域）
/// @param gridView 网格视图
/// @param column 对应的列
- (void)gridView:(FSGridView *)gridView didSelctedHeaderWithColumn:(NSInteger)column;

@end

/// 网格视图
@interface FSGridView : UIView

/// 数据源
@property (nonatomic, weak) id<FSGridViewDataSource> dataSource;

/// 委托
@property (nonatomic, weak) id<FSGridViewDelegate> delegate;

/// 尽量不要操作TableView
@property (nonatomic, strong, readonly) UITableView *tableView;

/// 注册cell用于重用
/// @param cellClass cell类
/// @param identifier 标识
- (void)registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;

/// 从重用队列取
/// @param identifier 标识
/// @param column 列
/// @param girdCell 网格对应的行Cell
- (UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier column:(NSInteger)column inGridCell:(FSGridViewCell *)girdCell;

@end

NS_ASSUME_NONNULL_END
