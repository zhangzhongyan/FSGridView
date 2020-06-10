//
//  FSStockGridView.m
//  Example
//
//  Created by 张忠燕 on 2020/6/10.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "FSStockGridView.h"
//Helper
#import <Masonry.h>

@interface FSStockGridView ()

/// 左侧渐变图层
@property (nonatomic, strong) UIView *leftSideFadeView;

/// 右侧指示图
@property (nonatomic, strong) UIImageView *scrollTagView;

@end

@implementation FSStockGridView

#pragma mark - Initialize Methods

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBinding];
    }
    return self;
}

#pragma mark - Private Methods

- (void)setupBinding
{
    //滚动阴影
    __weak typeof(self) weakSelf = self;
    self.gridViewDidScrollBlock = ^(FSGridView * _Nonnull gridView) {
        
        weakSelf.leftSideFadeView.hidden = (gridView.contentOffset.x <= 0.0f);
        
        
        if (gridView.contentSize.width > weakSelf.frame.size.width) {
            CGFloat offsetWidth = gridView.contentOffset.x + gridView.frame.size.width;
            weakSelf.scrollTagView.hidden = (offsetWidth >= gridView.contentSize.width);
        } else {
            weakSelf.scrollTagView.hidden = YES;
        }
    };
}


#pragma mark - Overwrite Methods

- (void)layoutSubviews
{
    [super layoutSubviews];

    if (!self.leftSideFadeView.superview) {
        
        CGFloat leftOffset = 0.0f;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridView:widthForColumn:)]) {
            leftOffset = [self.dataSource gridView:self widthForColumn:0];
        }
        [self addSubview:self.leftSideFadeView];
        [self.leftSideFadeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(leftOffset);
            make.width.equalTo(@(10.0f));
            make.top.bottom.equalTo(self);
        }];
    }
    
    if (!self.scrollTagView.superview) {
                
        CGFloat headHeight = 0.0f;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(gridViewHeightForHeader:)]) {
            headHeight = [self.dataSource gridViewHeightForHeader:self];
        }
        
        CGFloat top = (headHeight - 18.0f) / 2.0f;
        [self addSubview:self.scrollTagView];
        [self.scrollTagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.top.equalTo(@(top));
            make.width.equalTo(@(20.0f));
            make.height.equalTo(@(18.0f));
        }];
    }
}


+ (UIImage *)colorWithGradientwithSize:(CGSize)size andColors:(NSArray *)colors {
    
    //Create our background gradient layer
    CAGradientLayer *backgroundGradientLayer = [CAGradientLayer layer];
    
    //Set the frame to our object's bounds
    backgroundGradientLayer.frame = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    //To simplfy formatting, we'll iterate through our colors array and create a mutable array with their CG counterparts
    NSMutableArray *cgColors = [[NSMutableArray alloc] init];
    for (UIColor *color in colors) {
        [cgColors addObject:(id)[color CGColor]];
    }
    
    backgroundGradientLayer.colors = cgColors;
    
    //Specify the direction our gradient will take
    [backgroundGradientLayer setStartPoint:CGPointMake(0.0, 0.5)];
    [backgroundGradientLayer setEndPoint:CGPointMake(1.0, 0.5)];
    
    //Convert our CALayer to a UIImage object
    UIGraphicsBeginImageContext(backgroundGradientLayer.bounds.size);
    [backgroundGradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return backgroundColorImage;
}


#pragma mark - property

- (UIView *)leftSideFadeView
{
    if (!_leftSideFadeView) {
        UIImage *image = [FSStockGridView colorWithGradientwithSize:CGSizeMake(10.0f, 10.0f) andColors:@[[UIColor colorWithWhite:0.0f alpha:0.3f], [UIColor colorWithWhite:0.0f alpha:0.0f]]];
        _leftSideFadeView = [[UIView alloc] init];
        _leftSideFadeView.layer.contents = (id) image.CGImage;
        _leftSideFadeView.hidden = YES;
    }
    return _leftSideFadeView;
}

- (UIImageView *)scrollTagView
{
    if (!_scrollTagView) {
        _scrollTagView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"indicator"]];
    }
    return _scrollTagView;
}


@end

