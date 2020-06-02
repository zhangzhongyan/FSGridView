//
//  FSStockDemoVC.m
//  Example
//
//  Created by 张忠燕 on 2020/5/29.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "FSStockDemoVC.h"
//View
#import <FSGridView/FSGridView.h>
#import "FSStockMetaDataCell.h"
#import "FSStockTextCell.h"
//Helper
#import <Masonry.h>

@interface FSStockDemoVC ()<FSGridViewDataSource, FSGridViewDelegate>

@property (nonatomic, strong) FSGridView *gridView;

@property (nonatomic, copy) NSMutableArray<FSStockCellViewModel *> *stockViewModels;

@end

@implementation FSStockDemoVC

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

- (void)setupData
{
    FSStockModel *model1 = [[FSStockModel alloc] init];
    model1.name = @"上海银行";
    model1.leveragable = @(YES);
    model1.codeNumber = @"601229";
    model1.price = @"8.10";
    model1.increaseAmout = @"-0.12%";
    model1.totalMarketValue = @"1151亿";
    model1.totalCapital = @"142亿";
    model1.PERatio = @"5.49";
    
    FSStockCellViewModel *vm1 = [[FSStockCellViewModel alloc] initWithModel:model1];
    [self.stockViewModels addObject:vm1];
    
    FSStockModel *model2 = [[FSStockModel alloc] init];
    model2.name = @"燕塘乳业";
    model2.leveragable = @(NO);
    model2.codeNumber = @"002732";
    model2.price = @"22.50";
    model2.increaseAmout = @"+7.91%";
    model2.totalMarketValue = @"35.4亿";
    model2.totalCapital = @"1.6亿";
    model2.PERatio = @"1035.63";
    
    FSStockCellViewModel *vm2 = [[FSStockCellViewModel alloc] initWithModel:model2];
    [self.stockViewModels addObject:vm2];
    
    FSStockModel *model3 = [[FSStockModel alloc] init];
    model3.name = @"华侨城A";
    model3.leveragable = @(YES);
    model3.codeNumber = @"000069";
    model3.price = @"5.84";
    model3.increaseAmout = @"-0.34%";
    model3.totalMarketValue = @"479亿";
    model3.totalCapital = @"82亿";
    model3.PERatio = @"14.27";
    
    FSStockCellViewModel *vm3 = [[FSStockCellViewModel alloc] initWithModel:model3];
    [self.stockViewModels addObject:vm3];
    
    FSStockModel *model4 = [[FSStockModel alloc] init];
    model4.name = @"格力电器";
    model4.leveragable = @(YES);
    model4.codeNumber = @"000651";
    model4.price = @"56.94";
    model4.increaseAmout = @"+0.21%";
    model4.totalMarketValue = @"3425亿";
    model4.totalCapital = @"60.2亿";
    model4.PERatio = @"54.96";
    
    FSStockCellViewModel *vm4 = [[FSStockCellViewModel alloc] initWithModel:model4];
    [self.stockViewModels addObject:vm4];
    
    FSStockModel *model5 = [[FSStockModel alloc] init];
    model5.name = @"博实股份";
    model5.leveragable = @(YES);
    model5.codeNumber = @"002698";
    model5.price = @"11.08";
    model5.increaseAmout = @"+2.59%";
    model5.totalMarketValue = @"113亿";
    model5.totalCapital = @"10.2亿";
    model5.PERatio = @"24.67";
    
    FSStockCellViewModel *vm5 = [[FSStockCellViewModel alloc] initWithModel:model5];
    [self.stockViewModels addObject:vm5];
    
    FSStockModel *model6 = [[FSStockModel alloc] init];
    model6.name = @"金风科技";
    model6.leveragable = @(YES);
    model6.codeNumber = @"002202";
    model6.price = @"9.48";
    model6.increaseAmout = @"+0.74%";
    model6.totalMarketValue = @"401亿";
    model6.totalCapital = @"42.2亿";
    model6.PERatio = @"11.19";
    
    FSStockCellViewModel *vm6 = [[FSStockCellViewModel alloc] initWithModel:model6];
    [self.stockViewModels addObject:vm6];
    
    FSStockModel *model7 = [[FSStockModel alloc] init];
    model7.name = @"儿童节";
    model7.leveragable = @(YES);
    model7.codeNumber = @"002570";
    model7.price = @"9.77";
    model7.increaseAmout = @"+2.05%";
    model7.totalMarketValue = @"591亿";
    model7.totalCapital = @"100.2亿";
    model7.PERatio = @"13.87";
    
    FSStockCellViewModel *vm7 = [[FSStockCellViewModel alloc] initWithModel:model7];
    [self.stockViewModels addObject:vm7];
    
    FSStockModel *model8 = [[FSStockModel alloc] init];
    model8.name = @"贝因美";
    model8.leveragable = @(YES);
    model8.codeNumber = @"002570";
    model8.price = @"5.77";
    model8.increaseAmout = @"+1.05%";
    model8.totalMarketValue = @"59亿";
    model8.totalCapital = @"10.2亿";
    model8.PERatio = @"113.87";
    
    FSStockCellViewModel *vm8 = [[FSStockCellViewModel alloc] initWithModel:model8];
    [self.stockViewModels addObject:vm8];
    
    FSStockModel *model9 = [[FSStockModel alloc] init];
    model9.name = @"上海银行";
    model9.leveragable = @(YES);
    model9.codeNumber = @"601229";
    model9.price = @"8.10";
    model9.increaseAmout = @"-0.12%";
    model9.totalMarketValue = @"1151亿";
    model9.totalCapital = @"142亿";
    model9.PERatio = @"5.49";
    
    FSStockCellViewModel *vm9 = [[FSStockCellViewModel alloc] initWithModel:model9];
    [self.stockViewModels addObject:vm9];
    
    FSStockModel *model10 = [[FSStockModel alloc] init];
    model10.name = @"燕塘乳业";
    model10.leveragable = @(NO);
    model10.codeNumber = @"002732";
    model10.price = @"22.50";
    model10.increaseAmout = @"+7.91%";
    model10.totalMarketValue = @"35.4亿";
    model10.totalCapital = @"1.6亿";
    model10.PERatio = @"1035.63";
    
    FSStockCellViewModel *vm10 = [[FSStockCellViewModel alloc] initWithModel:model10];
    [self.stockViewModels addObject:vm10];
    
    FSStockModel *model11 = [[FSStockModel alloc] init];
    model11.name = @"华侨城A";
    model11.leveragable = @(YES);
    model11.codeNumber = @"000069";
    model11.price = @"5.84";
    model11.increaseAmout = @"-0.34%";
    model11.totalMarketValue = @"479亿";
    model11.totalCapital = @"82亿";
    model11.PERatio = @"14.27";
    
    FSStockCellViewModel *vm11 = [[FSStockCellViewModel alloc] initWithModel:model11];
    [self.stockViewModels addObject:vm11];
    
    FSStockModel *model12 = [[FSStockModel alloc] init];
    model12.name = @"格力电器";
    model12.leveragable = @(YES);
    model12.codeNumber = @"000651";
    model12.price = @"56.94";
    model12.increaseAmout = @"+0.21%";
    model12.totalMarketValue = @"3425亿";
    model12.totalCapital = @"60.2亿";
    model12.PERatio = @"54.96";
    
    FSStockCellViewModel *vm12 = [[FSStockCellViewModel alloc] initWithModel:model12];
    [self.stockViewModels addObject:vm12];
    
    FSStockModel *model13 = [[FSStockModel alloc] init];
    model13.name = @"博实股份";
    model13.leveragable = @(YES);
    model13.codeNumber = @"002698";
    model13.price = @"11.08";
    model13.increaseAmout = @"+2.59%";
    model13.totalMarketValue = @"113亿";
    model13.totalCapital = @"10.2亿";
    model13.PERatio = @"24.67";
    
    FSStockCellViewModel *vm13 = [[FSStockCellViewModel alloc] initWithModel:model13];
    [self.stockViewModels addObject:vm13];
    
    FSStockModel *model14 = [[FSStockModel alloc] init];
    model14.name = @"金风科技";
    model14.leveragable = @(YES);
    model14.codeNumber = @"002202";
    model14.price = @"9.48";
    model14.increaseAmout = @"+0.74%";
    model14.totalMarketValue = @"401亿";
    model14.totalCapital = @"42.2亿";
    model14.PERatio = @"11.19";
    
    FSStockCellViewModel *vm14 = [[FSStockCellViewModel alloc] initWithModel:model14];
    [self.stockViewModels addObject:vm14];
    
    FSStockModel *model15 = [[FSStockModel alloc] init];
    model15.name = @"贝因美";
    model15.leveragable = @(YES);
    model15.codeNumber = @"002570";
    model15.price = @"5.77";
    model15.increaseAmout = @"+1.05%";
    model15.totalMarketValue = @"59亿";
    model15.totalCapital = @"10.2亿";
    model15.PERatio = @"113.87";
    
    FSStockCellViewModel *vm15 = [[FSStockCellViewModel alloc] initWithModel:model15];
    [self.stockViewModels addObject:vm15];
    
    FSStockModel *model16 = [[FSStockModel alloc] init];
    model16.name = @"上海银行";
    model16.leveragable = @(YES);
    model16.codeNumber = @"601229";
    model16.price = @"8.10";
    model16.increaseAmout = @"-0.12%";
    model16.totalMarketValue = @"1151亿";
    model16.totalCapital = @"142亿";
    model16.PERatio = @"5.49";
    
    FSStockCellViewModel *vm16 = [[FSStockCellViewModel alloc] initWithModel:model6];
    [self.stockViewModels addObject:vm16];
    
    FSStockModel *model17 = [[FSStockModel alloc] init];
    model17.name = @"燕塘乳业";
    model17.leveragable = @(NO);
    model17.codeNumber = @"002732";
    model17.price = @"22.50";
    model17.increaseAmout = @"+7.91%";
    model17.totalMarketValue = @"35.4亿";
    model17.totalCapital = @"1.6亿";
    model17.PERatio = @"1035.63";
    
    FSStockCellViewModel *vm17 = [[FSStockCellViewModel alloc] initWithModel:model17];
    [self.stockViewModels addObject:vm17];
    
    FSStockModel *model18 = [[FSStockModel alloc] init];
    model18.name = @"华侨城A";
    model18.leveragable = @(YES);
    model18.codeNumber = @"000069";
    model18.price = @"5.84";
    model18.increaseAmout = @"-0.34%";
    model18.totalMarketValue = @"479亿";
    model18.totalCapital = @"82亿";
    model18.PERatio = @"14.27";
    
    FSStockCellViewModel *vm18 = [[FSStockCellViewModel alloc] initWithModel:model18];
    [self.stockViewModels addObject:vm18];
    
    FSStockModel *model19 = [[FSStockModel alloc] init];
    model19.name = @"格力电器";
    model19.leveragable = @(YES);
    model19.codeNumber = @"000651";
    model19.price = @"56.94";
    model19.increaseAmout = @"+0.21%";
    model19.totalMarketValue = @"3425亿";
    model19.totalCapital = @"60.2亿";
    model19.PERatio = @"54.96";
    
    FSStockCellViewModel *vm19 = [[FSStockCellViewModel alloc] initWithModel:model19];
    [self.stockViewModels addObject:vm19];
    
    FSStockModel *model20 = [[FSStockModel alloc] init];
    model20.name = @"博实股份";
    model20.leveragable = @(YES);
    model20.codeNumber = @"002698";
    model20.price = @"11.08";
    model20.increaseAmout = @"+2.59%";
    model20.totalMarketValue = @"113亿";
    model20.totalCapital = @"10.2亿";
    model20.PERatio = @"24.67";
    
    FSStockCellViewModel *vm20 = [[FSStockCellViewModel alloc] initWithModel:model20];
    [self.stockViewModels addObject:vm20];
    
    FSStockModel *model21 = [[FSStockModel alloc] init];
    model21.name = @"金风科技";
    model21.leveragable = @(YES);
    model21.codeNumber = @"002202";
    model21.price = @"9.48";
    model21.increaseAmout = @"+0.74%";
    model6.totalMarketValue = @"401亿";
    model21.totalCapital = @"42.2亿";
    model21.PERatio = @"11.19";
    
    FSStockCellViewModel *vm21 = [[FSStockCellViewModel alloc] initWithModel:model21];
    [self.stockViewModels addObject:vm21];
    
    FSStockModel *model22 = [[FSStockModel alloc] init];
    model22.name = @"贝因美";
    model22.leveragable = @(YES);
    model22.codeNumber = @"002570";
    model22.price = @"5.77";
    model22.increaseAmout = @"+1.05%";
    model22.totalMarketValue = @"59亿";
    model22.totalCapital = @"10.2亿";
    model22.PERatio = @"113.87";
    
    FSStockCellViewModel *vm22 = [[FSStockCellViewModel alloc] initWithModel:model22];
    [self.stockViewModels addObject:vm22];
    
    FSStockModel *model23 = [[FSStockModel alloc] init];
    model23.name = @"上海银行";
    model23.leveragable = @(YES);
    model23.codeNumber = @"601229";
    model23.price = @"8.10";
    model23.increaseAmout = @"-0.12%";
    model23.totalMarketValue = @"1151亿";
    model23.totalCapital = @"142亿";
    model23.PERatio = @"5.49";
    
    FSStockCellViewModel *vm23 = [[FSStockCellViewModel alloc] initWithModel:model23];
    [self.stockViewModels addObject:vm23];
    
    FSStockModel *model24 = [[FSStockModel alloc] init];
    model24.name = @"燕塘乳业";
    model24.leveragable = @(NO);
    model24.codeNumber = @"002732";
    model24.price = @"22.50";
    model24.increaseAmout = @"+7.91%";
    model24.totalMarketValue = @"35.4亿";
    model24.totalCapital = @"1.6亿";
    model24.PERatio = @"1035.63";
    
    FSStockCellViewModel *vm24 = [[FSStockCellViewModel alloc] initWithModel:model24];
    [self.stockViewModels addObject:vm24];
    
    FSStockModel *model25 = [[FSStockModel alloc] init];
    model25.name = @"华侨城A";
    model25.leveragable = @(YES);
    model25.codeNumber = @"000069";
    model25.price = @"5.84";
    model25.increaseAmout = @"-0.34%";
    model25.totalMarketValue = @"479亿";
    model25.totalCapital = @"82亿";
    model25.PERatio = @"14.27";
    
    FSStockCellViewModel *vm25 = [[FSStockCellViewModel alloc] initWithModel:model25];
    [self.stockViewModels addObject:vm25];
    
    FSStockModel *model26 = [[FSStockModel alloc] init];
    model26.name = @"格力电器";
    model26.leveragable = @(YES);
    model26.codeNumber = @"000651";
    model26.price = @"56.94";
    model26.increaseAmout = @"+0.21%";
    model26.totalMarketValue = @"3425亿";
    model26.totalCapital = @"60.2亿";
    model26.PERatio = @"54.96";
    
    FSStockCellViewModel *vm26 = [[FSStockCellViewModel alloc] initWithModel:model26];
    [self.stockViewModels addObject:vm26];
    
    FSStockModel *model27 = [[FSStockModel alloc] init];
    model27.name = @"博实股份";
    model27.leveragable = @(YES);
    model27.codeNumber = @"002698";
    model27.price = @"11.08";
    model27.increaseAmout = @"+2.59%";
    model27.totalMarketValue = @"113亿";
    model27.totalCapital = @"10.2亿";
    model27.PERatio = @"24.67";
    
    FSStockCellViewModel *vm27 = [[FSStockCellViewModel alloc] initWithModel:model27];
    [self.stockViewModels addObject:vm27];
    
    FSStockModel *model28 = [[FSStockModel alloc] init];
    model28.name = @"金风科技";
    model28.leveragable = @(YES);
    model28.codeNumber = @"002202";
    model28.price = @"9.48";
    model28.increaseAmout = @"+0.74%";
    model28.totalMarketValue = @"401亿";
    model28.totalCapital = @"42.2亿";
    model28.PERatio = @"11.19";
    
    FSStockCellViewModel *vm28 = [[FSStockCellViewModel alloc] initWithModel:model28];
    [self.stockViewModels addObject:vm28];
    
    FSStockModel *model29 = [[FSStockModel alloc] init];
    model29.name = @"贝因美";
    model29.leveragable = @(YES);
    model29.codeNumber = @"002570";
    model29.price = @"5.77";
    model29.increaseAmout = @"+1.05%";
    model29.totalMarketValue = @"59亿";
    model29.totalCapital = @"10.2亿";
    model29.PERatio = @"113.87";
    
    FSStockCellViewModel *vm29 = [[FSStockCellViewModel alloc] initWithModel:model29];
    [self.stockViewModels addObject:vm29];
}

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

- (NSMutableArray<FSStockCellViewModel *> *)stockViewModels {
    if (!_stockViewModels) {
        _stockViewModels = [NSMutableArray array];
    }
    return _stockViewModels;
}

@end

