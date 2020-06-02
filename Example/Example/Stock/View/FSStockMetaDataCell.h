//
//  FSStockMetaDataCell.h
//  Example
//
//  Created by 张忠燕 on 2020/5/30.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSStockCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

/// 股票表格左侧元数据Cell
@interface FSStockMetaDataCell : UICollectionViewCell

/// 设置内容
/// @param cellVM cellVM
- (void)setContentWithCellVM:(FSStockCellViewModel *)cellVM;

/// 宽度
+ (CGFloat)cellWidth;

/// 高度
+ (CGFloat)cellHeight;

@end

NS_ASSUME_NONNULL_END
