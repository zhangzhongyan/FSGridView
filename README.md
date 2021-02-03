


# FSGridView

iOS网格视图，主要用于类似股票、课程表、属性表。 使用CollectionViewCell定制，重用机制，标准数据源委托协议，更容易嵌入。

#### 版本修改

|  版本   | 修改内容  |
|  ----  | ----  |
| v1.0.1  | 增加滚动阴影、右侧指示视图 |
| v1.0.2  | 增加ReloadData、增加ContentSize（用于滚动处理）、私有方法保护 |
| v1.0.3  | 修复头部滚动问题 |
| v1.0.4  | 处理重用后，滚动位置变更问题 |
| v1.0.5  | collectionview重用indexPath越界问题 |
| v1.0.6  | FSGridViewCell.contentView覆盖问题 |
| v1.0.7  | 处理FSGridViewCell定制化需求 |
| v1.0.8  | 处理FSGridViewCell.layoutSubViews处理滚动问题 |



请查看workspace工中的**Example**示例项目。 下载后，您将需要运行pod install。

# 示例效果

<img src="https://github.com/zhangzhongyan/Documents/blob/master/Photos/xcode/FSGridView/stockDemo.png?raw=true" width="320" height="693">


# 示例代码


### 添加FSGridView


```obj-c

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
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.gridView];
    [self.gridView addSubview:self.leftSideFadeView];
    [self.gridView addSubview:self.rightSideIndicatorView];
}

- (void)setupConstraints
{
    [self.gridView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
    }];
    
    CGFloat originX = [self gridView:self.gridView widthForColumn:0];;
    [self.leftSideFadeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(originX));
        make.width.equalTo(@(10.0f));
        make.top.bottom.equalTo(self.gridView);
    }];
    
    CGFloat originY = ([self gridViewHeightForHeader:self.gridView] - 10.0f) / 2.0f;
    [self.rightSideIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.gridView);
        make.width.height.equalTo(@(10.0f));
        make.top.equalTo(self.gridView).offset(originY);
    }];
}

#pragma mark - property

- (FSStockGridView *)gridView {
    if (!_gridView) {
        _gridView = [[FSStockGridView alloc] init];
        _gridView.backgroundColor = UIColor.whiteColor;
        [_gridView registerClass:FSStockMetaDataCell.class forCellWithReuseIdentifier:NSStringFromClass(FSStockMetaDataCell.class)];
        [_gridView registerClass:FSStockTextCell.class forCellWithReuseIdentifier:NSStringFromClass(FSStockTextCell.class)];
        _gridView.dataSource = self;
        _gridView.delegate = self;
    }
    return _gridView;
}

```

### 实现FSGridView的数据源和委托协议

```

#pragma mark - <FSGridViewDataSource>

/// 多少列
/// @param gridView 网格视图
- (NSInteger)numberOfColumnsInGridView:(FSGridView *)gridView
{
    return FSStockCellViewModel.numbersOfStockProperty;
}

/// 多少行
/// @param gridView 网格视图
- (NSInteger)numberOfRowsInGridView:(FSGridView *)gridView
{
    return self.stockViewModels.count;
}

/// 列宽
/// @param gridView 网格视图
- (CGFloat)gridView:(FSGridView *)gridView widthForColumn:(NSInteger)column
{
    FSStockCellPropertyType type = column;
    switch (type) {
            //名字
        case FSStockCellPropertyTypeName: {
            return FSStockMetaDataCell.cellWidth;
        }
            //价格
        case FSStockCellPropertyTypePrice: {
            return 80.0f;
        }
            //涨幅
        case FSStockCellPropertyTypeIncreaseAmout: {
            return 80.0f;
        }
            //总市值
        case FSStockCellPropertyTypeTotalMarketValue: {
            return 80.0f;
        }
            //总股本
        case FSStockCellPropertyTypeTotalCapital: {
            return 80.0f;
        }
            //市盈率
        case FSStockCellPropertyTypePERatio: {
            return 80.0f;
        }
        case FSStockCellPropertyTypeCount: {
            return 80.0f;
        }
     }
}

/// 行高
/// @param gridView 网格视图
- (CGFloat)gridView:(FSGridView *)gridView heightForRow:(NSInteger)row
{
    return FSStockMetaDataCell.cellHeight;
}

/// 固定头部高度
/// @param gridView 网格视图
- (CGFloat)gridViewHeightForHeader:(FSGridView *)gridView
{
    return FSStockTextCell.cellHeight;
}

/// 返回对应的单元
/// @param gridView 网格视图
/// @param row 行位置
/// @param column 列位置
- (UICollectionViewCell *)gridView:(FSGridView *)gridView cellForRow:(NSInteger)row column:(NSInteger)column inGridCell:(nonnull FSGridViewCell *)girdCell
{
    FSStockCellViewModel *cellVM = [self.stockViewModels objectAtIndex:row];
    if (!column) {
        FSStockMetaDataCell *cell = (FSStockMetaDataCell *)[gridView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(FSStockMetaDataCell.class) column:column inGridCell:girdCell];
        [cell setContentWithCellVM:cellVM];
        return cell;
    } else {
        FSStockTextCell *cell = (FSStockTextCell *)[gridView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(FSStockTextCell.class) column:column inGridCell:girdCell];
        cell.label.attributedText = [cellVM stockProperyTextAtIndex:column];
        return cell;
    }
}

/// 返回对应的单元（固定头部区域）
/// @param gridView 网格视图
/// @param girdCell 网格对应的行Cell
/// @param column 列位置
- (UICollectionViewCell *)gridView:(FSGridView *)gridView cellForHeaderWithColumn:(NSInteger)column inGridCell:(FSGridViewCell *)girdCell
{
    FSStockTextCell *cell = (FSStockTextCell *)[gridView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(FSStockTextCell.class) column:column inGridCell:girdCell];
    cell.label.text = [FSStockCellViewModel stockProperyDescTextAtIndex:column];
    return cell;
}


#pragma mark - <FSGridViewDelegate>


/// 点击对应的视图
/// @param gridView 网格视图
/// @param row 对应的行
/// @param column 对应的列
- (void)gridView:(FSGridView *)gridView didSelctedAtRow:(NSInteger)row column:(NSInteger)column
{
    
}

/// 点击对应的视图（固定头部区域）
/// @param gridView 网格视图
/// @param column 对应的列
- (void)gridView:(FSGridView *)gridView didSelctedHeaderWithColumn:(NSInteger)column
{
    
}

```

### 滚动处理

由于滚动处理的业务是各自定制化需求，所以开发者可自行根据需要，集成FSGridView进行滚动处理的方式：

1.继承FSGridView，提供gridViewDidScrollBlock、gridViewDidEndDeceleratingBlock、gridViewDidEndDraggingBlock的属性

2.包含FSGridView, 提供gridViewDidScrollBlock、gridViewDidEndDeceleratingBlock、gridViewDidEndDraggingBlock的属性

3.Demo工程中**FSStockGridView**直接使用





