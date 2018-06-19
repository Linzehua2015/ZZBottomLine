//
//  UICollectionView+ZZBottomLine.m
//  
//
//  Created by 林泽华 on 2018/6/19.
//  Copyright © 2018年 LinZehua. All rights reserved.
//

#import "UICollectionView+ZZBottomLine.h"
#import <objc/runtime.h>

@interface UICollectionView()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) ZZBottomLineParam *param;
@end

@implementation UICollectionView(ZZBottomLine)

- (void)zz_addBottomLineWithScrollView:(UIScrollView *)scrollView {
    ZZBottomLineParam *param = [ZZBottomLineParam new];
    param.scrollView = scrollView;
    param.itemCount = scrollView.contentSize.width / CGRectGetWidth(scrollView.frame);
    param.lineWidth = 40;
    param.lineHeight = 2;
    [self zz_addBottomLineWithParam:param];
}

- (void)zz_addBottomLineWithParam:(ZZBottomLineParam *)param {
    
    self.param = param;
    [self initLineView];
    [self.param.scrollView addObserver:self
                            forKeyPath:@"contentOffset"
                               options:NSKeyValueObservingOptionNew
                               context:nil];
}

- (void)initLineView {
    // 初始化，默认选中第一个
    self.lineView = [[UIImageView alloc] init];
    self.lineView.backgroundColor = self.param.color;
    CGFloat width = self.param.lineWidth;
    CGFloat height = self.param.lineHeight;
    CGFloat x = ((self.frame.size.width / self.param.itemCount) - width) * 0.5;
    CGFloat y = self.frame.size.height - height;
    self.lineView.frame = CGRectMake(x, y, width, height);
    [self insertSubview:self.lineView atIndex:0];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self dynamicLineView];
    }
}

- (void)dynamicLineView {
    
    UIScrollView *scrollView = self.param.scrollView;
    CGFloat itemCount = self.param.itemCount; // 栏目数量
    CGFloat lineWidth = self.param.lineWidth; // selectView的最小宽度
    CGFloat lineHeight = self.param.lineHeight; // selectView的高度
    
    CGFloat cellWidth = floor(self.bounds.size.width / itemCount);
    CGFloat scrollWidth = CGRectGetWidth(self.param.scrollView.frame);
    CGFloat scale = cellWidth / scrollWidth;
    CGFloat beginCenterX = cellWidth * 0.5;
    CGFloat y = self.bounds.size.height - lineHeight * 0.5;
    CGFloat x = beginCenterX + scale * scrollView.contentOffset.x;
    self.lineView.center = CGPointMake(x, y);
    
    NSInteger index = (scrollView.contentOffset.x + scrollWidth * 0.5) / scrollWidth;
    CGFloat leftX = beginCenterX + cellWidth * index;
    
    CGFloat width = ABS(x - leftX) * 2 + lineWidth;
    self.lineView.bounds = CGRectMake(0, 0, width, lineHeight);
}

#pragma mark - Set Get

static char bottomLineKey;
- (UIView *)lineView {
    return objc_getAssociatedObject(self, &bottomLineKey);
}
- (void)setLineView:(UIView *)lineView {
    objc_setAssociatedObject(self, &bottomLineKey, lineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static char paramKey;
- (ZZBottomLineParam *)param {
    return objc_getAssociatedObject(self, &paramKey);
}
- (void)setParam:(ZZBottomLineParam *)param {
    objc_setAssociatedObject(self, &paramKey, param, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
