//
//  FSAttributedStringMaker.m
//  FSAttributedString
//
//  Created by 张忠燕 on 2020/5/26.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "FSAttributedStringMaker.h"
 
@interface FSAttributedStringMaker ()

@property (nonatomic, copy) NSMutableArray<FSAttributedStringModel *> *stringModels;

/** 段落属性 */
@property (nonatomic, strong, nullable) NSParagraphStyle *allParagrahs;

@end

@implementation FSAttributedStringMaker

#pragma mark - Public Methods

+ (NSAttributedString *)makeAttributedString:(void(^)(FSAttributedStringMaker *maker))block
{
    FSAttributedStringMaker *maker = [[FSAttributedStringMaker alloc] init];
    block(maker);
    return [maker attributedString];
}


- (FSAttributedStringModel * (^)(NSString * _Nullable))append
{
    return ^id (NSString * _Nullable text) {
        FSAttributedStringPropertyModel *propertyModel = [[FSAttributedStringPropertyModel alloc] init];
        FSAttributedStringModel *stringModel = [[FSAttributedStringModel alloc] initWithString:text propertyModel:propertyModel];
        [self.stringModels addObject:stringModel];
        return stringModel;
    };
}

- (void (^)(NSParagraphStyle *))paragrah
{
    return ^(NSParagraphStyle * _Nullable paragrahStyle) {
        self.allParagrahs = paragrahStyle;
    };
}

#pragma mark - Private Methods

- (NSAttributedString *)attributedString
{
    NSMutableAttributedString *items = [[NSMutableAttributedString alloc] init];
    for (FSAttributedStringModel *model in self.stringModels) {
        NSAttributedString *item = [[NSAttributedString alloc] initWithString:model.string attributes:model.propertyModel.attributes];
        [items appendAttributedString:item];
    }
    
    if (self.allParagrahs) {
        [items addAttribute:NSParagraphStyleAttributeName value:self.allParagrahs range:NSMakeRange(0, items.length)];
    }
    
    return items;
}

#pragma mark - property

- (NSMutableArray<FSAttributedStringModel *> *)stringModels {
    if (!_stringModels) {
        _stringModels = [NSMutableArray array];
    }
    return _stringModels;
}

@end
