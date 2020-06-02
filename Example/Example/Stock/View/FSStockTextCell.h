//
//  FSStockTextCell.h
//  Example
//
//  Created by 张忠燕 on 2020/5/30.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 股票表格右侧文本Cell
@interface FSStockTextCell : UICollectionViewCell

/// 文本
@property (nonatomic, strong, readonly) UILabel *label;

/// 高度
+ (CGFloat)cellHeight;

@end

NS_ASSUME_NONNULL_END
