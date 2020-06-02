//
//  FSStockCellViewModel.h
//  Example
//
//  Created by 张忠燕 on 2020/5/31.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSStockModel.h"

NS_ASSUME_NONNULL_BEGIN

/** 存续日志-状态 */
typedef NS_ENUM(NSInteger, FSStockCellPropertyType) {
    /** 名称 */
    FSStockCellPropertyTypeName = 0,
    /** 价格  */
    FSStockCellPropertyTypePrice,
    /** 涨幅 */
    FSStockCellPropertyTypeIncreaseAmout,
    /** 总市值 */
    FSStockCellPropertyTypeTotalMarketValue,
    /** 总股本 */
    FSStockCellPropertyTypeTotalCapital,
    /** 市盈率 */
    FSStockCellPropertyTypePERatio,
    /** 个数 */
    FSStockCellPropertyTypeCount,
};

/// 股票网格celVM
@interface FSStockCellViewModel : NSObject

/// 数据源
@property (nonatomic, strong, readonly) FSStockModel *model;

/// 指定构造方法
/// @param model 视图模型
- (instancetype)initWithModel:(FSStockModel *)model;
- (instancetype)init NS_UNAVAILABLE;

/// 显示的股票属性个数
+ (NSInteger)numbersOfStockProperty;

/// 对应的属性文本
/// @param index 属性位置
- (nullable NSAttributedString *)stockProperyTextAtIndex:(NSInteger)index;

/// 对应的描述文本
/// @param index 属性位置
+ (NSString *)stockProperyDescTextAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
