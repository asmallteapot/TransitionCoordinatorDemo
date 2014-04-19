//
//  ASTLeagueViewController.h
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASTLeague;


@interface ASTLeagueViewController : UITableViewController
/// The league to display.
@property (weak, nonatomic) ASTLeague *league;
@end
