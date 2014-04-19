//
//  ASTTeamViewController.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTTeamViewController.h"

#import "UIColor+ASTNavigation.h"
#import "ASTTeam.h"


@interface ASTTeamViewController ()
/// The web view in which to display the team's article.
@property (weak, nonatomic) IBOutlet UIWebView *webView;

/// Updates the receiver for the current team.
- (void)updateTeam;
@end


@implementation ASTTeamViewController

- (void)awakeFromNib {
	[super awakeFromNib];
}


- (void)viewDidLoad {
	[super viewDidLoad];
	[self updateTeam];
}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];

	[[self transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
		UINavigationBar *navigationBar = self.navigationController.navigationBar;
		navigationBar.barTintColor = self.team.color;
		navigationBar.tintColor = [self.team.color navigationTextColor];
		navigationBar.titleTextAttributes = @{
			NSForegroundColorAttributeName: [self.team.color navigationTextColor],
		};
		[self setNeedsStatusBarAppearanceUpdate];
	} completion:NULL];
}


- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];

	[[self transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
		UINavigationBar *navigationBar = self.navigationController.navigationBar;
		navigationBar.barTintColor = nil;
		navigationBar.tintColor = nil;
		navigationBar.titleTextAttributes = nil;
	} completion:NULL];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
	return [self.team.color preferredStatusBarStyle];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
}


#pragma mark - Property accessors
- (void)setTeam:(ASTTeam *)team {
	if (_team == team) return;
	_team = team;

	[self updateTeam];
}


#pragma mark - Private interface
- (void)updateTeam {
	if (!self.view || !self.team) {
		return;
	}

	self.navigationItem.title = self.team.name;

	NSURLRequest *request = [NSURLRequest requestWithURL:self.team.URL];
	[self.webView loadRequest:request];
}

@end
