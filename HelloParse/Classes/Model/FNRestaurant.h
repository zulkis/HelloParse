//
//  FNRestaurant.h
//  HelloParse
//
//  Created by Alexey Minaev on 31/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import <Parse/Parse.h>

@interface FNRestaurant : PFObject <PFSubclassing>

@property (nonatomic, copy) NSString *title;

+ (void)getAllRestaurantsWithCompletion:(void(^)(NSArray *restaurants, NSError *error))completion;

- (void)getAllMealsWithCompletion:(void(^)(NSArray *meals, NSError *error))completion;

@end
