//
//  FSStockCellViewModel.m
//  Example
//
//  Created by 张忠燕 on 2020/5/31.
//  Copyright © 2020 张忠燕. All rights reserved.
//

//VM
#import "FSStockCellViewModel.h"
//Helper
#import <FSAttributedString/FSAttributedString.h>

@interface FSStockCellViewModel ()

@property (nonatomic, strong) FSStockModel *model;

@end

@implementation FSStockCellViewModel

#pragma mark - Initialize Methods

- (instancetype)initWithModel:(FSStockModel *)model
{
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}

#pragma mark - Public Methods

- (nullable NSAttributedString *)stockProperyTextAtIndex:(NSInteger)index
{
    
    FSStockCellPropertyType type = index;
    switch (type) {
            //名字
        case FSStockCellPropertyTypeCount:
        case FSStockCellPropertyTypeName: {
            return nil;
        }
            //价格
        case FSStockCellPropertyTypePrice: {
            
            return [FSAttributedStringMaker makeAttributedString:^(FSAttributedStringMaker * _Nonnull make) {
                NSString *price = self.model.price.length? self.model.price: @"--";
                UIColor *hasPriceColor = [self.model.increaseAmout containsString:@"+"]? UIColor.redColor: [UIColor colorWithRed:42.0f/255 green:201.0f/255 blue:66.0f/255 alpha:1.0f];
                UIColor *color = self.model.price.length? hasPriceColor: UIColor.grayColor;
                make.append(price).color(color);
            }];
        }
            //涨幅
        case FSStockCellPropertyTypeIncreaseAmout: {
            return [FSAttributedStringMaker makeAttributedString:^(FSAttributedStringMaker * _Nonnull make) {
                NSString *text = self.model.increaseAmout.length? self.model.increaseAmout: @"--";
                UIColor *hasPriceColor = [self.model.increaseAmout containsString:@"+"]? UIColor.redColor: [UIColor colorWithRed:42.0f/255 green:201.0f/255 blue:66.0f/255 alpha:1.0f];
                UIColor *color = self.model.increaseAmout.length? hasPriceColor: UIColor.grayColor;
                make.append(text).color(color);
            }];
        }
            //总市值
        case FSStockCellPropertyTypeTotalMarketValue: {
            return [FSAttributedStringMaker makeAttributedString:^(FSAttributedStringMaker * _Nonnull make) {
                NSString *text = self.model.totalMarketValue.length? self.model.totalMarketValue: @"--";
                make.append(text).color(UIColor.grayColor);
            }];
        }
            //总股本
        case FSStockCellPropertyTypeTotalCapital: {
            return [FSAttributedStringMaker makeAttributedString:^(FSAttributedStringMaker * _Nonnull make) {
                NSString *text = self.model.totalCapital.length? self.model.totalCapital: @"--";
                make.append(text).color(UIColor.grayColor);
            }];
        }
            //市盈率
        case FSStockCellPropertyTypePERatio: {
            return [FSAttributedStringMaker makeAttributedString:^(FSAttributedStringMaker * _Nonnull make) {
                NSString *text = self.model.PERatio.length? self.model.PERatio: @"--";
                make.append(text).color(UIColor.grayColor);
            }];
        }
            
    }
}

+ (NSString *)stockProperyDescTextAtIndex:(NSInteger)index
{
    FSStockCellPropertyType type = index;
    switch (type) {
        case FSStockCellPropertyTypeCount: {
            return @"";
        }
        case FSStockCellPropertyTypeName: {
            return @"名称";
        }
        case FSStockCellPropertyTypePrice: {
            return @"价格";
        }
        case FSStockCellPropertyTypeIncreaseAmout: {
            return @"涨幅";
        }
        case FSStockCellPropertyTypeTotalMarketValue: {
            return @"总市值";
        }
        case FSStockCellPropertyTypeTotalCapital: {
            return @"总股本";
        }
        case FSStockCellPropertyTypePERatio: {
            return @"市盈率";
        }
    }
}

+ (NSInteger)numbersOfStockProperty
{
    return FSStockCellPropertyTypeCount;
}



@end
