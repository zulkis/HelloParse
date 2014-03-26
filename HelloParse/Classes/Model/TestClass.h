//
//  TestClass.h
//  HelloParse
//
//  Created by Alexey Minaev on 26/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import <Parse/Parse.h>

@interface TestClass : PFObject <PFSubclassing>

@property (nonatomic, copy) NSString *title;

@end
