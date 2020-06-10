//
//  FSStockGridView.h
//  Example
//
//  Created by 张忠燕 on 2020/6/10.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "FSGridView.h"

NS_ASSUME_NONNULL_BEGIN

/// 网格视图（增加滚动阴影处理）
@interface FSStockGridView : FSGridView

/// 左侧渐变图层
@property (nonatomic, strong, readonly) UIView *leftSideFadeView;

@end

NS_ASSUME_NONNULL_END
