//
//  FNRestaurant.m
//  HelloParse
//
//  Created by Alexey Minaev on 31/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import "FNRestaurant.h"
#import <Parse/PFObject+Subclass.h>
#import "FNMeal.h"

@implementation FNRestaurant

@dynamic title;

+ (NSString *)parseClassName {
    return NSStringFromClass([self class]);
}

#pragma mark - API Methods
#warning Should we do all the query stuff in 1 big class?

+ (void)getAllRestaurantsWithCompletion:(void(^)(NSArray *restaurants, NSError *error))completion {
    [PFCloud callFunctionInBackground:@"getAllRestaurants" withParameters:@{} block:^(id object, NSError *error) {
        completion(object, error);
    }];
}

- (void)getAllMealsWithCompletion:(void(^)(NSArray *meals, NSError *error))completion {
    [PFCloud callFunctionInBackground:@"getMeals" withParameters:@{@"restaurantId":self.objectId} block:^(id object, NSError *error) {
        completion(object, error);
    }];
}

@end
