//
//  VisibleFormViewController.h
//  VisibleInputWhenShowKeyboard
//
//  Created by Damien Romito on 22/01/15.
//  Copyright (c) 2015 Damien Romito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VisibleFormViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UIView *lastVisibleView;
@property (nonatomic) CGFloat visibleMargin;

@end
