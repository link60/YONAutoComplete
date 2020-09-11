//
//  ViewController.m
//  YONAutoComplete
//
//  Created by Yonat Sharon on 5/6/14.
//  Copyright (c) 2014 Yonat Sharon. All rights reserved.
//

#import "ViewController.h"
#import "YONAutoComplete.h"

@interface ViewController ()
@property (nonatomic, strong) YONAutoComplete *autoComplete;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, 300, 24)];
    [self.view addSubview:textField];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    textField.text = @"Lorem ipsum dolor sit amet, tempor.";
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;

    self.autoComplete = [YONAutoComplete new];
    textField.delegate = self.autoComplete;
    self.autoComplete.completionsFileName = @"other";
    self.autoComplete.maxCompletions = 7;
    self.autoComplete.superDelegate = self;
    self.autoComplete.hideCompletionList = YES;
    
    [textField becomeFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidEndEditing");
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn");
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"shouldChangeCharactersInRange");
    return NO;
}

@end
