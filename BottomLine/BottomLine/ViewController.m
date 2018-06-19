//
//  ViewController.m
//  BottomLine
//
//  Created by 林泽华 on 2018/6/19.
//  Copyright © 2018年 林泽华. All rights reserved.
//

#import "ViewController.h"
#import "UICollectionView+ZZBottomLine.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *segCollectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // scrollView内容
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.scrollView.contentSize = CGSizeMake(width * 2, 0);
    CGRect frame = self.scrollView.bounds;
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor orangeColor];
    view.frame = frame;
    [self.scrollView addSubview:view];
    
    view = [UIView new];
    view.backgroundColor = [UIColor greenColor];
    frame.origin.x = width;
    view.frame = frame;
    [self.scrollView addSubview:view];

    // 添加bottomView
    [self.segCollectionView zz_addBottomLineWithScrollView:self.scrollView];
    
    /* 或者通过这种方式添加
     ZZBottomLineParam *param = [ZZBottomLineParam new];
     param.scrollView = self.scrollView;
     param.itemCount = 2;
     param.lineWidth = 40;
     param.lineHeight = 2;
     [self.segCollectionView zz_addBottomLineWithParam:param];
     */
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0) {
        static NSString *cellId = @"cell1";
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        return cell;
    } else {
        static NSString *cellId = @"cell2";
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        return cell;
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = collectionView.bounds.size.width * 0.5;
    return CGSizeMake(width, collectionView.bounds.size.height);
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat x = CGRectGetWidth(self.scrollView.bounds) * indexPath.item;
    [UIView animateWithDuration:0.2 animations:^{
        self.scrollView.contentOffset = CGPointMake(x, 0);
    }];
}

@end
