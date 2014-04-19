//
//  ASTLeagueViewController.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTLeagueViewController.h"

#import "ASTTeamViewController.h"
#import "ASTEmbedSegue.h"

#import "ASTLeague.h"
#import "ASTDivision.h"
#import "ASTTeam.h"


/// Reuse identifier for team cells.
static NSString * const ASTTeamCellIdentifier = @"ASTTeamCell";


@interface ASTLeagueViewController ()
/**
 Returns the team at a given index path.
 @param indexPath The index path of the league to return.
 @return The team at the given index path.
 */
- (ASTTeam *)teamAtIndexPath:(NSIndexPath *)indexPath;

/// Updates the receiver for the current league.
- (void)updateLeague;
@end


@implementation ASTLeagueViewController

- (void)awakeFromNib {
	[super awakeFromNib];
}


- (void)viewDidLoad {
	[super viewDidLoad];
	[self updateLeague];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.destinationViewController isKindOfClass:[ASTTeamViewController class]]) {
		ASTTeamViewController *destinationVC = segue.destinationViewController;
		ASTTeam *team = [self teamAtIndexPath:[self.tableView indexPathForSelectedRow]];
		destinationVC.team = team;
	}
}


#pragma mark - Property accessors
- (void)setLeague:(ASTLeague *)league {
	if (_league == league) return;
	_league = league;

	[self updateLeague];
}


#pragma mark - Private interface
- (ASTTeam *)teamAtIndexPath:(NSIndexPath *)indexPath {
	return [self.league.divisions[indexPath.section] teams][indexPath.row];
}


- (void)updateLeague {
	if (!self.view || !self.league) {
		return;
	}

	self.navigationItem.title = self.league.name;
	[self.tableView reloadData];
}


#pragma mark - Table View data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.league.divisions count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	ASTDivision *division = self.league.divisions[section];
	return division.name;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	ASTDivision *division = self.league.divisions[section];
    return [division.teams count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ASTTeamCellIdentifier forIndexPath:indexPath];
	ASTTeam *team = [self teamAtIndexPath:indexPath];
	cell.textLabel.text = team.name;
	return cell;
}

@end
