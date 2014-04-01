//
//  FNMeal.h
//  HelloParse
//
//  Created by Alexey Minaev on 31/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import <Parse/Parse.h>
#import <Parse/PFSubclassing.h>

@interface FNMeal : PFObject <PFSubclassing>

@property (nonatomic, copy) NSString *title;

@end
