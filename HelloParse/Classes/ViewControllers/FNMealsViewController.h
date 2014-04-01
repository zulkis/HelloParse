//
//  CollectionViewController.h
//  HelloParse
//
//  Created by Alexey Minaev on 26/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FNRestaurant;

@interface FNMealsViewController : UICollectionViewController

@property (nonatomic, strong) FNRestaurant *restaurant;

@end
