//
//  FSStockModel.h
//  Example
//
//  Created by 张忠燕 on 2020/5/29.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 股票模型
@interface FSStockModel : NSObject

/// 名称
@property (nonatomic, copy, nullable) NSString *name;

/// 是否支持融资融券
@property (nonatomic, copy, nullable) NSNumber *leveragable;

/// 代码号
@property (nonatomic, copy, nullable) NSString *codeNumber;

/// 价格
@property (nonatomic, copy, nullable) NSString *price;

/// 涨幅
@property (nonatomic, copy, nullable) NSString *increaseAmout;

/// 总市值
@property (nonatomic, copy, nullable) NSString *totalMarketValue;

/// 总股本
@property (nonatomic, copy, nullable) NSString *totalCapital;

/// 市盈率
@property (nonatomic, copy, nullable) NSString *PERatio;

@end

NS_ASSUME_NONNULL_END
