//
//  UIBarButtonItem+ASTBackButtonItem.h
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIBarButtonItem (ASTBackButtonItem)
+ (instancetype)backButtonItemWithTarget:(id)target action:(SEL)action;
@end