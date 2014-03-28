//
//  CollectionViewCell.m
//  HelloParse
//
//  Created by Alexey Minaev on 26/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell ()

@property (nonatomic, weak, readwrite) IBOutlet UIImageView *imageView;
@property (nonatomic) CGRect initialImageViewFrame;

@end

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.initialImageViewFrame = self.imageView.frame;
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(CollectionViewCell*)object change:(NSDictionary *)change context:(void *)context {
//    CGRect frame = object.frame;
//    NSLog(@"%@", NSStringFromCGRect(frame));
//}
//
//- (void)dealloc {
//    [self removeObserver:self forKeyPath:@"self.center"];
//}
//
//- (void)layoutSubviews {
//    [super layoutSubviews];
//}

- (void)setParallaxPosition:(CGFloat)position {
    CGRect bounds = [self bounds];

    const CGFloat padding = (bounds.size.height - bounds.size.width) / 3.0;
    CGFloat offsetY =  padding * position;
    
    CGRect imageRect = [self.imageView frame];
    imageRect.origin.y = CGRectGetMinY(self.initialImageViewFrame) + offsetY;
    [self.imageView setFrame:imageRect];
}

@end
