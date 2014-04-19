//
//  ASTDivision.h
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTModel.h"
#import "ASTLeague.h"


/// Model object for baseball divisions
@interface ASTDivision : ASTModel
/// The league this division belongs to.
@property (strong, nonatomic) ASTLeague *league;

/// The division's name.
@property (strong, nonatomic) NSString *name;

/// The division's URL.
@property (strong, nonatomic) NSURL *URL;

/// The teams belonging to this divisions.
@property (strong, nonatomic) NSArray *teams;
@end
