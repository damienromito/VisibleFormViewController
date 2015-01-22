//
//  ViewController.m
//  VisibleInputWhenShowKeyboard
//
//  Created by Damien Romito on 22/01/15.
//  Copyright (c) 2015 Damien Romito. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController


- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField * field1 = [UITextField new];
    field1.translatesAutoresizingMaskIntoConstraints = NO;
    field1.backgroundColor = [UIColor grayColor];
    field1.layer.cornerRadius = 3;
    field1.clipsToBounds = YES;
    field1.delegate = self;
    [self.view addSubview:field1];
    
    UILabel *label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = @"The keyboard will never hide this view";
    label.textColor = [UIColor blueColor];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(field1,label);
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-[field1]-|"
                               options: NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
                               metrics:0
                               views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-300-[field1(44)]-[label]"
                               options: NSLayoutFormatAlignAllRight | NSLayoutFormatAlignAllLeft
                               metrics:0
                               views:views]];
    
    //SET THE LAST VIEW WHICH THE KEYBOARD WILL NOT HIDE
    self.lastVisibleView = label;
    self.visibleMargin = 15.;
    
}


@end
