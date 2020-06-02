//
//  UILabel+FSAttributedString.m
//  FSAttributedString
//
//  Created by 张忠燕 on 2020/5/26.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "UILabel+FSAttributedString.h"

@implementation UILabel (FSAttributedString)

- (void)fs_makeAttributedString:(void(^)(FSAttributedStringMaker *make))block
{
    self.attributedText = [FSAttributedStringMaker makeAttributedString:block];
}

@end
