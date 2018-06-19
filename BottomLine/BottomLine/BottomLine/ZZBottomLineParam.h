//
//  ZZBottomLineParam.h
//  ExpressionKingdom
//
//  Created by 林泽华 on 2018/6/19.
//  Copyright © 2018年 LinZehua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZBottomLineParam : NSObject

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, assign) CGFloat itemCount; // 栏目数量
@property (nonatomic, assign) CGFloat lineWidth; // 横线的宽度
@property (nonatomic, assign) CGFloat lineHeight; // 横线的高度
@property (nonatomic, copy) UIColor *color; // 默认是黑色

@end
