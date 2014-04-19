//
//  UIColor+ASTNavigation.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "UIColor+ASTNavigation.h"


@implementation UIColor (ASTNavigation)

- (UIColor *)navigationTextColor {
	switch ([self preferredStatusBarStyle]) {
		case UIStatusBarStyleDefault: {
			return [UIColor blackColor];
			break;
		}

		case UIStatusBarStyleLightContent: {
			return [UIColor whiteColor];
			break;
		}

		default: {
			break;
		}
	}

	return nil;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
	CGFloat whiteValue;
	CGFloat alphaValue;
	if ([self getWhite:&whiteValue alpha:&alphaValue]) {
		if (whiteValue < 0.5) {
			return UIStatusBarStyleLightContent;
		} else {
			return UIStatusBarStyleDefault;
		}
	}

	return UIStatusBarStyleDefault;
}

@end
