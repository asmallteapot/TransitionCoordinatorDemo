//
//  ASTTeamViewController.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTTeamViewController.h"
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


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


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
