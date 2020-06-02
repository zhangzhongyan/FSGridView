//
//  UILabel+FSAttributedString.h
//  FSAttributedString
//
//  Created by 张忠燕 on 2020/5/26.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSAttributedStringMaker.h"

NS_ASSUME_NONNULL_BEGIN

/// 扩展
@interface UILabel (FSAttributedString)

/// 添加属性文本
/// @param block 定制Block
- (void)fs_makeAttributedString:(void(^)(FSAttributedStringMaker *make))block;

@end

NS_ASSUME_NONNULL_END
