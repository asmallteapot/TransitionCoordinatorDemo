//
//  ASTEmbedSegue.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTEmbedSegue.h"


@interface ASTEmbedSegue ()
@end


@implementation ASTEmbedSegue

- (void)perform {
	Protocol *sourceProtocol = @protocol(ASTEmbedSegueSource);
	NSAssert([self.sourceViewController conformsToProtocol:sourceProtocol], @"%s: Source view controller must conform to %@", __PRETTY_FUNCTION__, NSStringFromProtocol(sourceProtocol));

	UIViewController<ASTEmbedSegueSource> *sourceVC = self.sourceViewController;
	UIViewController *destinationVC = self.destinationViewController;
	UIView *containerView = [sourceVC containerViewForEmbedSegue:self];

	[sourceVC addChildViewController:destinationVC];
	[containerView addSubview:destinationVC.view];
	destinationVC.view.frame = containerView.bounds;
	destinationVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[destinationVC didMoveToParentViewController:sourceVC];
}

@end
