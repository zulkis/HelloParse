//
//  CollectionViewCell.h
//  HelloParse
//
//  Created by Alexey Minaev on 26/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNMealCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak, readonly) IBOutlet UIImageView *imageView;
@property (nonatomic, weak, readonly) IBOutlet UILabel *titleLabel;

- (void)setParallaxPosition:(CGFloat)position;

@end
