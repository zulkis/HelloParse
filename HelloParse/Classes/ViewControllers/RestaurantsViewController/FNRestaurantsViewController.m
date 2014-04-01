//
//  FNRestaurantsViewController.m
//  HelloParse
//
//  Created by Alexey Minaev on 31/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import "FNRestaurantsViewController.h"
#import "FNRestaurantViewCell.h"
#import "FNRestaurant.h"

#import "FNMealsViewController.h"

@interface FNRestaurantsViewController ()

@property (nonatomic, strong) NSArray *restaurants;

@end

@implementation FNRestaurantsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [FNRestaurant getAllRestaurantsWithCompletion:^(NSArray *restaurants, NSError *error) {
        if (!error) {
            self.restaurants = restaurants;
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error);
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.restaurants count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FNRestaurantViewCell class]) forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    FNRestaurantViewCell *restCell = (FNRestaurantViewCell*)cell;
    FNRestaurant *rest = self.restaurants[indexPath.row];
    restCell.titleLabel.text = rest.title;
}

#pragma mark - IBSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:NSStringFromClass([FNMealsViewController class])]) {
        NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
        ((FNMealsViewController*)segue.destinationViewController).restaurant = self.restaurants[ip.row];
    }
}

@end
