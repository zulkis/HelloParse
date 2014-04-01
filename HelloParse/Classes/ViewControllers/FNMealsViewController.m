//
//  CollectionViewController.m
//  HelloParse
//
//  Created by Alexey Minaev on 26/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import "FNMealsViewController.h"
#import "FNCollectionViewDynamicWaterfallLayout.h"
#import "FNMealCollectionViewCell.h"
#import "FNRestaurant.h"
#import "FNMeal.h"

@interface FNMealsViewController () <FNCollectionViewDynamicWaterfallLayoutDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSArray *meals;

@end

@implementation FNMealsViewController {
    NSMutableArray *_itemSizes;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self precalculateItemSizes];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.restaurant getAllMealsWithCompletion:^(NSArray *meals, NSError *error) {
        self.meals = meals;
        
        [self precalculateItemSizes];
        [self.collectionView reloadData];
    }];
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
    FNMeal *meal = self.meals[indexPath.row];
    FNMealCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", arc4random()%6+1]];
    cell.titleLabel.text = meal.title;
    CGFloat position = [self parallaxPositionForCell:cell];
    [cell setParallaxPosition:position];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.meals count];
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
