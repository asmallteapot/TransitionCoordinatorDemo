//
//  UIBarButtonItem+ASTBackButtonItem.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "UIBarButtonItem+ASTBackButtonItem.h"


@implementation UIBarButtonItem (ASTBackButtonItem)

+ (instancetype)backButtonItemWithTarget:(id)target action:(SEL)action {
	return [[self alloc] initWithTitle:@"\u200B" style:UIBarButtonItemStylePlain target:target action:action];
}

@end
