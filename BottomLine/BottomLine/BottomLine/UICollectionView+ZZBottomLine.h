//
//  UICollectionView+ZZBottomLine.h
//  ExpressionKingdom
//
//  Created by 林泽华 on 2018/6/19.
//  Copyright © 2018年 LinZehua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZBottomLineParam.h"

@interface UICollectionView(ZZBottomLine)
- (void)zz_addBottomLineWithScrollView:(UIScrollView *)scrollView;
- (void)zz_addBottomLineWithParam:(ZZBottomLineParam *)param;
@end
