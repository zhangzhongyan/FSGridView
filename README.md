


# FSGridView

iOS网格视图，主要用于类似股票、课程表、属性表。 使用CollectionViewCell定制，重用机制，标准数据源委托协议，更容易嵌入。

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
}

- (void)setupConstraints
{
    [self.gridView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(@(100.0f));
    }];
}

#pragma mark - property

- (FSGridView *)gridView {
    if (!_gridView) {
        _gridView = [[FSGridView alloc] init];
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

# Pods验证

#### 本地验证：
pod lib lint

#### 远程验证准备：
podspec版本、xcode工程版本

#### 推送公有仓库：
##### 注册设备
在向cocoapods远程仓库提交自己的podspec，需要进行设备注册（认证）。

```
pod trunk register xxx@xxx.com 'my name' --description='my macbook air'
```
然后查看自己的邮件，复制邮件中的链接，用浏览器打开即可。（此操作可能出现失败，需良好的网络环境）

##### 提交.podspec
```
pod trunk push FSAttributedString.podspec
```
注意命令执行的目录，需要项目根目录执行。



