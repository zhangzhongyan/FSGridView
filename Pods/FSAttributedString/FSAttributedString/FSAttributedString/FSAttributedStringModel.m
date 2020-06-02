//
//  FSAttributedStringModel.m
//  FSAttributedString
//
//  Created by 张忠燕 on 2020/5/26.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "FSAttributedStringModel.h"

@implementation FSAttributedStringModel

#pragma mark - Initialize Methods

- (instancetype)initWithString:(NSString *)string propertyModel:(FSAttributedStringPropertyModel *)propertyModel
{
    self = [super init];
    if (self) {
        _string = string.copy;
        _propertyModel = propertyModel;
    }
    return self;
}

#pragma mark - Public Methods

- (FSAttributedStringModel *(^)(UIColor * _Nullable))color
{
    return ^id (UIColor * _Nullable color) {
        self.propertyModel.foregroundColor = color;
        return self;
    };
}

- (FSAttributedStringModel *(^)(UIFont * _Nullable))font
{
    return ^id (UIFont * _Nullable font) {
        self.propertyModel.font = font;
        return self;
    };
}

- (FSAttributedStringModel *(^)(NSNumber * _Nullable))baselineOffset
{
    return ^id (NSNumber * _Nullable baselineOffset) {
        self.propertyModel.baselineOffset = baselineOffset;
        return self;
    };
}

- (FSAttributedStringModel *(^)(NSNumber * _Nullable))underlineStyle
{
    return ^id (NSNumber * _Nullable underlineStyle) {
        self.propertyModel.underlineStyle = underlineStyle;
        return self;
    };
}

- (FSAttributedStringModel *(^)(NSParagraphStyle * _Nullable))paragraphStyle
{
    return ^id (NSParagraphStyle * _Nullable paragraphStyle) {
        self.propertyModel.paragraphStyle = paragraphStyle;
        return self;
    };
}

@end
