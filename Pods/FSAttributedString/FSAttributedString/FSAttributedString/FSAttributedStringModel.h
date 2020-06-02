//
//  FSAttributedStringModel.h
//  FSAttributedString
//
//  Created by 张忠燕 on 2020/5/26.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSAttributedStringPropertyModel.h"

NS_ASSUME_NONNULL_BEGIN

/// 字符模型
@interface FSAttributedStringModel : NSObject

/** 字符 */
@property (nonatomic, copy, readonly) NSString *string;

/** 属性模型 */
@property (nonatomic, strong, readonly) FSAttributedStringPropertyModel *propertyModel;

/** 指定构造方法 */
- (instancetype)initWithString:(NSString *)string propertyModel:(FSAttributedStringPropertyModel *)propertyModel NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

/** 设置颜色 */
- (FSAttributedStringModel *(^)(UIColor * _Nullable))color;

/** 设置字体 */
- (FSAttributedStringModel *(^)(UIFont * _Nullable))font;

/** 设置基准线 */
- (FSAttributedStringModel *(^)(NSNumber * _Nullable))baselineOffset;

/** 设置下划线 */
- (FSAttributedStringModel *(^)(NSNumber * _Nullable))underlineStyle;

/** 设置段落 */
- (FSAttributedStringModel *(^)(NSParagraphStyle * _Nullable))paragraphStyle;

@end

NS_ASSUME_NONNULL_END
