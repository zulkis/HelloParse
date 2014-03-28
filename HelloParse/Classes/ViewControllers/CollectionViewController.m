//
//  CollectionViewController.m
//  HelloParse
//
//  Created by Alexey Minaev on 26/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

@implementation CollectionViewController {
    NSMutableArray *_itemSizes;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self precalculateItemSizes];
}

- (void)viewWillAppear:(BOOL)animated {
//    [self updateVisibleCellsWithParallax];
}

- (void)precalculateItemSizes {
    NSUInteger count = [self collectionView:self.collectionView numberOfItemsInSection:0];
    _itemSizes = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i ++) {
        CGFloat height = (CGFloat)(160 + ((arc4random()%4) * 20));
        [_itemSizes addObject:[NSValue valueWithCGSize:CGSizeMake(148, height)]];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout  *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSValue *value = _itemSizes[indexPath.row];
    return [value CGSizeValue];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", arc4random()%6+1]];
    CGFloat position = [self parallaxPositionForCell:cell];
    [cell setParallaxPosition:position];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark - Parallax

- (CGFloat)parallaxPositionForCell:(UICollectionViewCell *)cell {
    
    CGRect frame = [cell frame];
    CGPoint point = [self.collectionView convertPoint:frame.origin toView:self.collectionView];
    
    const CGFloat minY = CGRectGetMinY([self.collectionView bounds]) - frame.size.height;
    const CGFloat maxY = CGRectGetMaxY([self.collectionView bounds]);
    
    const CGFloat minPos = -1.0f;
    const CGFloat maxPos = 1.0f;
    
    return -((maxPos - minPos) / (maxY - minY) * (point.y - minY) + minPos);
}

- (void)updateVisibleCellsWithParallax {
    for (id cell in [self.collectionView visibleCells]) {
        CGFloat position = [self parallaxPositionForCell:cell];
        [cell setParallaxPosition:position];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateVisibleCellsWithParallax];
}

@end
