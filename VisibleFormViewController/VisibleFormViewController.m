//
//  VisibleFormViewController.m
//  VisibleInputWhenShowKeyboard
//
//  Created by Damien Romito on 22/01/15.
//  Copyright (c) 2015 Damien Romito. All rights reserved.
//

#import "VisibleFormViewController.h"

@interface VisibleFormViewController()
@property (nonatomic) CGFloat visibleOffset;
@end

@implementation VisibleFormViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    self.visibleMargin = 10.;
}

#pragma keyboard height

- (void) keyboardWillShow:(NSNotification *)note
{
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    CGRect frame = self.view.frame;
    CGFloat visibleHeight = frame.size.height - keyboardBounds.size.height ;
    CGFloat lastVisiblePointY = self.lastVisibleView.frame.origin.y + self.lastVisibleView.frame.size.height;
    if (self.lastVisibleView && self.visibleOffset == 0 && (lastVisiblePointY + self.visibleMargin ) > visibleHeight) {
        self.visibleOffset = lastVisiblePointY - visibleHeight + self.visibleMargin ;
        frame.origin.y -= self.visibleOffset;
    }
  
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    self.view.frame = frame;

    [UIView commitAnimations];
}


- (void) keyboardWillHide:(NSNotification *)note
{
        NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
        NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];

        CGRect frame = self.view.frame;
        frame.origin.y += self.visibleOffset;
        self.visibleOffset = 0;
    
    	[UIView beginAnimations:nil context:NULL];
    	[UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:[duration doubleValue]];
        [UIView setAnimationCurve:[curve intValue]];
    
    	self.view.frame = frame;
    
    	[UIView commitAnimations];
}


#pragma -mark TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [self.view endEditing:YES];
    
    return YES;
}


@end
