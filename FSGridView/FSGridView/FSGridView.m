//
//  FSGridView.m
//  FSGridView
//
//  Created by 张忠燕 on 2020/5/28.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "FSGridView.h"

@interface FSGridView ()<FSGridViewCellDataSource, UITableViewDataSource, UITableViewDelegate>

/// 重用信息
@property (nonatomic, strong) NSMutableDictionary *reuseDict;

@property (nonatomic, strong) FSGridViewCell *sectionHeaderView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) CGPoint cellLastOffset;

@end

@implementation FSGridView

#pragma mark - Initialize Methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInitData];
    }
    return self;
}

#pragma mark - Private Methods

- (void)setupInitData
{
    [self addSubview:self.tableView];
}

- (void)scrollToLastScrollX {
    NSArray *cells = [self.tableView visibleCells];
    for (FSGridViewCell *cell in cells) {
        cell.rightCollectionView.delegate = nil;
        [cell.rightCollectionView setContentOffset:CGPointMake(self.cellLastOffset.x, 0) animated:NO];
        cell.rightCollectionView.delegate = cell;
    }
    
    self.sectionHeaderView.rightCollectionView.delegate = nil;
    [self.sectionHeaderView.rightCollectionView setContentOffset:CGPointMake(self.cellLastOffset.x, 0) animated:NO];
    self.sectionHeaderView.rightCollectionView.delegate = self.sectionHeaderView;
}

#pragma mark - Public Methods

- (void)registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier
{
    if (cellClass) {
        [self.reuseDict setObject:NSStringFromClass(cellClass) forKey:identifier];
    }
}

- (UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier column:(NSInteger)column inGridCell:(nonnull FSGridViewCell *)girdCell
{
    //第0列
    if (!column) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        return [girdCell.leftCollectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    } else {
        NSInteger section = column - 1;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:section];
        return [girdCell.rightCollectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    }
}

#pragma mark - Overwrite Methods

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self scrollToLastScrollX];
}

#pragma mark - <FSGridViewCellDataSource>

- (NSInteger)numberOfColumnsInCell:(FSGridViewCell *)cell
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfColumnsInGridView:)]) {
        return [self.dataSource numberOfColumnsInGridView:self];
    } else {
        return 0;;
    }
}

- (CGFloat)gridViewCell:(FSGridViewCell *)cell widthForColumn:(NSInteger)column
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridView:widthForColumn:)]) {
        return [self.dataSource gridView:self widthForColumn:column];
    } else {
        return 0.0f;
    }
}

- (UICollectionViewCell *)gridViewCell:(FSGridViewCell *)cell cellForColumn:(NSInteger)column
{
    if (cell == self.sectionHeaderView) {
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridView:cellForHeaderWithColumn:inGridCell:)]) {
            return [self.dataSource gridView:self cellForHeaderWithColumn:column inGridCell:cell];
        } else {
            return nil;
        }
    } else {
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridView:cellForRow:column:inGridCell:)]) {
            return [self.dataSource gridView:self cellForRow:cell.gridRowIndex column:column inGridCell:cell];
        } else {
            return nil;
        }
    }
}

- (void)gridViewCell:(FSGridViewCell *)cell didSelectItemAtColumn:(NSInteger)column
{
    if (cell == self.sectionHeaderView) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(gridView:didSelctedHeaderWithColumn:)]) {
            [self.delegate gridView:self didSelctedHeaderWithColumn:column];
        }
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(gridView:didSelctedAtRow:column:)]) {
            [self.delegate gridView:self didSelctedAtRow:cell.gridRowIndex column:column];
        }
    }
}

- (void)gridViewCell:(FSGridViewCell *)sender didScroll:(UIScrollView *)scrollView
{
    if (scrollView == sender.rightCollectionView) {
        NSArray<FSGridViewCell *> *cells = [self.tableView visibleCells];
        for (FSGridViewCell *cell in cells) {
            if (cell != sender) {
                cell.rightCollectionView.delegate = nil;
                [cell.rightCollectionView setContentOffset:CGPointMake(sender.rightCollectionView.contentOffset.x, 0) animated:NO];
                cell.rightCollectionView.delegate = cell;
            }
        }
        
        if (sender != self.sectionHeaderView) {
            self.sectionHeaderView.rightCollectionView.delegate = nil;
            [self.sectionHeaderView.rightCollectionView setContentOffset:CGPointMake(sender.rightCollectionView.contentOffset.x, 0) animated:NO];
            self.sectionHeaderView.rightCollectionView.delegate = self.sectionHeaderView;
        }
    }
    
    self.cellLastOffset = sender.rightCollectionView.contentOffset;
    
//    - (void)linkAgeScrollView:(UIScrollView*)sender{
//        NSArray* visibleCells = [self.stockTableView visibleCells];
//        for (JJStockViewCell* cell in visibleCells) {
//            if (cell.rightContentScrollView != sender) {
//                cell.rightContentScrollView.delegate = nil;//disable send scrollViewDidScroll message
//                [cell.rightContentScrollView setContentOffset:CGPointMake(sender.contentOffset.x, 0) animated:NO];
//                cell.rightContentScrollView.delegate = self;//enable send scrollViewDidScroll message
//            }
//        }
//        if (sender != self.headScrollView) {
            
//        }
//
//
//        _lastScrollX = sender.contentOffset.x;
//    }
    
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)tasection
{
    NSInteger rows = 0;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfRowsInGridView:)]) {
        rows = [self.dataSource numberOfRowsInGridView:self];
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FSGridViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass(FSGridViewCell.class)];
    if (!cell) {
        cell = [[FSGridViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:NSStringFromClass(FSGridViewCell.class)
                                          dataSource:self];
        
        for (NSString *key in self.reuseDict.allKeys) {
            Class class = NSClassFromString([self.reuseDict objectForKey:key]);
            [cell.leftCollectionView registerClass:class forCellWithReuseIdentifier:key];
            [cell.rightCollectionView registerClass:class forCellWithReuseIdentifier:key];
        }
    }
    
    //更新内容
    cell.gridRowIndex = indexPath.row;
    [cell.leftCollectionView reloadData];
    [cell.rightCollectionView reloadData];
    
    return cell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat height = 0.0f;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewHeightForHeader:)]) {
        height = [self.dataSource gridViewHeightForHeader:self];
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0f;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridView:heightForRow:)]) {
        height = [self.dataSource gridView:self heightForRow:indexPath.row];
    }
    return height;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.sectionHeaderView;
}

#pragma mark - property

- (NSMutableDictionary *)reuseDict {
    if (!_reuseDict) {
        _reuseDict = [NSMutableDictionary dictionary];
    }
    return _reuseDict;
}

- (UITableView*)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = UIColor.clearColor;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        //关闭估算行高
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}

- (FSGridViewCell *)sectionHeaderView {
    if (!_sectionHeaderView) {
        FSGridViewCell *cell = [[FSGridViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(FSGridViewCell.class) dataSource:self];
        for (NSString *key in self.reuseDict.allKeys) {
            Class class = NSClassFromString([self.reuseDict objectForKey:key]);
            [cell.leftCollectionView registerClass:class forCellWithReuseIdentifier:key];
            [cell.rightCollectionView registerClass:class forCellWithReuseIdentifier:key];
        }
        _sectionHeaderView = cell;
    }
    return _sectionHeaderView;
}

@end
