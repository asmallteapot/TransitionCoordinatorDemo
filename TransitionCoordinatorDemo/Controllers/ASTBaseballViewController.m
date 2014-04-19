//
//  ASTBaseballViewController.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTBaseballViewController.h"

#import "ASTLeagueViewController.h"
#import "ASTEmbedSegue.h"

#import "ASTLeague.h"


@interface ASTBaseballViewController () <ASTEmbedSegueSource>
/// Segmented control for switching between leagues.
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

/// Container view for the selected league.
@property (weak, nonatomic) IBOutlet UIView *containerView;
@end


@implementation ASTBaseballViewController

- (void)awakeFromNib {
	[super awakeFromNib];
}


- (void)viewDidLoad {
	[super viewDidLoad];

	// Configure the segmented control
	self.navigationItem.titleView = self.segmentedControl;
	[self.segmentedControl removeAllSegments];
	NSUInteger idx = 0;
	for (ASTLeague *league in [ASTLeague allLeagues]) {
		[self.segmentedControl insertSegmentWithTitle:league.name atIndex:idx animated:NO];
		idx++;
	}

	// Select the first league
	self.segmentedControl.selectedSegmentIndex = 0;
	[self performSegueWithIdentifier:@"EmbedLeagueInBaseball" sender:nil];
	[self.view setNeedsLayout];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.destinationViewController isKindOfClass:[ASTLeagueViewController class]]) {
		ASTLeagueViewController *destinationVC = segue.destinationViewController;
		ASTLeague *selectedLeague = [ASTLeague allLeagues][self.segmentedControl.selectedSegmentIndex];
		destinationVC.league = selectedLeague;
	}
}



#pragma mark - Embed Segue source
- (UIView *)containerViewForEmbedSegue:(ASTEmbedSegue *)segue {
	return self.containerView;
}


@end
