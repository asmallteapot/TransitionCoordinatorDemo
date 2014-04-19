//
//  ASTNavigationController.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTNavigationController.h"
#import "UIBarButtonItem+ASTBackButtonItem.h"


@interface ASTNavigationController () <UINavigationControllerDelegate>
- (IBAction)goBack:(id)sender;
@end


@implementation ASTNavigationController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.delegate = self;
}


- (UIViewController *)childViewControllerForStatusBarStyle {
	return self.visibleViewController;
}


#pragma mark - Navigation Controller delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
	viewController.navigationItem.backBarButtonItem = [UIBarButtonItem backButtonItemWithTarget:self action:@selector(goBack:)];
}


#pragma mark - IB Actions
- (IBAction)goBack:(id)sender {
	[self popViewControllerAnimated:YES];
}

@end
