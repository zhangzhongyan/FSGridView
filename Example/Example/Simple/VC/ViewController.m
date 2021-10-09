//
//  ViewController.m
//  Example
//
//  Created by 张忠燕 on 2020/5/29.
//  Copyright © 2020 张忠燕. All rights reserved.
//

//VC
#import "ViewController.h"
//View
#import <FSGridView/FSGridView.h>
#import "FSLeftTitleCollectionViewCell.h"
#import "FSRightCollectionViewCell.h"

@interface ViewController ()<FSGridViewDataSource, FSGridViewDelegate>

@property (nonatomic, strong) FSGridView *gridView;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupData];
    [self setupSubviews];
    [self setupConstraints];
}

#pragma mark - Private Methods

- (void)setupSubviews
{
    self.view.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.gridView];
}

- (void)setupConstraints
{
    self.gridView.frame = CGRectMake(0.0f, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
}

- (void)setupData
{
    
}

#pragma mark - <FSGridViewDataSource>

/// 多少列
/// @param gridView 网格视图
- (NSInteger)numberOfColumnsInGridView:(FSGridView *)gridView
{
    return 10;
}

/// 多少行
/// @param gridView 网格视图
- (NSInteger)numberOfRowsInGridView:(FSGridView *)gridView
{
    return 200;
}

/// 列宽
/// @param gridView 网格视图
- (CGFloat)gridView:(FSGridView *)gridView widthForColumn:(NSInteger)column
{
    if (column == 0) {
        return 120;
    } else {
        return 80;
    }
}

/// 行高
/// @param gridView 网格视图
- (CGFloat)gridView:(FSGridView *)gridView heightForRow:(NSInteger)row
{
    return 44;
}

/// 固定头部高度
/// @param gridView 网格视图
- (CGFloat)gridViewHeightForHeader:(FSGridView *)gridView
{
    return 44;
}

/// 返回对应的单元
/// @param gridView 网格视图
/// @param row 行位置
/// @param column 列位置
- (UICollectionViewCell *)gridView:(FSGridView *)gridView cellForRow:(NSInteger)row column:(NSInteger)column inGridCell:(nonnull FSGridViewCell *)girdCell
{
    if (!column) {
        FSLeftTitleCollectionViewCell *cell = (FSLeftTitleCollectionViewCell *)[gridView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(FSLeftTitleCollectionViewCell.class) column:column inGridCell:girdCell];
        
        cell.label.text = [NSString stringWithFormat:@"第%ld行第%ld列", row, column];
    
        return cell;
    } else {
        FSRightCollectionViewCell *cell = (FSRightCollectionViewCell *)[gridView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(FSRightCollectionViewCell.class) column:column inGridCell:girdCell];
        
        cell.label.text = [NSString stringWithFormat:@"第%ld列", column];
        
        return cell;
    }
}

/// 返回对应的单元（固定头部区域）
/// @param gridView 网格视图
/// @param girdCell 网格对应的行Cell
/// @param column 列位置
- (UICollectionViewCell *)gridView:(FSGridView *)gridView cellForHeaderWithColumn:(NSInteger)column inGridCell:(FSGridViewCell *)girdCell
{
    if (!column) {
        FSLeftTitleCollectionViewCell *cell = (FSLeftTitleCollectionViewCell *)[gridView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(FSLeftTitleCollectionViewCell.class) column:column inGridCell:girdCell];
        
        cell.label.text = @"左上角头部";
    
        return cell;
    } else {
        FSRightCollectionViewCell *cell = (FSRightCollectionViewCell *)[gridView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(FSRightCollectionViewCell.class) column:column inGridCell:girdCell];
        
        cell.label.text = [NSString stringWithFormat:@"标题%ld", column];
        
        return cell;
    }
}


#pragma mark - <FSGridViewDelegate>


/// 点击对应的视图
/// @param gridView 网格视图
/// @param collectionCell 网格单元格
/// @param row 对应的行
/// @param column 对应的列
- (void)gridView:(FSGridView *)gridView collectionCell:(nullable UICollectionViewCell *)collectionCell didSelctedAtRow:(NSInteger)row column:(NSInteger)column
{
    
}

/// 点击对应的视图（固定头部区域）
/// @param gridView 网格视图
/// @param collectionCell 网格单元格
/// @param column 对应的列
- (void)gridView:(FSGridView *)gridView collectionCell:(nullable UICollectionViewCell *)collectionCell didSelctedHeaderWithColumn:(NSInteger)column
{
    
}

#pragma mark - property

- (FSGridView *)gridView {
    if (!_gridView) {
        _gridView = [[FSGridView alloc] init];
        _gridView.backgroundColor = UIColor.clearColor;
        [_gridView registerClass:FSLeftTitleCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(FSLeftTitleCollectionViewCell.class)];
        [_gridView registerClass:FSRightCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(FSRightCollectionViewCell.class)];
        _gridView.dataSource = self;
        _gridView.delegate = self;
    }
    return _gridView;
}

@end
