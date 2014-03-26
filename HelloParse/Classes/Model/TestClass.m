//
//  TestClass.m
//  HelloParse
//
//  Created by Alexey Minaev on 26/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import "TestClass.h"
#import <Parse/PFObject+Subclass.h>

@implementation TestClass

@dynamic title;

+ (NSString *)parseClassName {
    return NSStringFromClass([self class]);
}

@end
