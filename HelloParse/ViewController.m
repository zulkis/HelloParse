//
//  ViewController.m
//  HelloParse
//
//  Created by Alexey Minaev on 26/03/14.
//  Copyright (c) 2014 Alexey Minaev. All rights reserved.
//

#import "ViewController.h"
#import "TestClass.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextField *titleTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onCreateButtonTap:(id)sender {
    if ([self.titleTextField.text length] < 4) {
        [[[UIAlertView alloc] initWithTitle:@"Short title"
                                    message:@"Minimum 4 chars"
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"Ok", nil] show];
    } else {
        __block TestClass *testObj = [TestClass object];
        testObj.title = self.titleTextField.text;
        [testObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            self.titleLabel.text = testObj.title;
        }];
    }
}

@end
