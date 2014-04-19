//
//  ASTTeam.h
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTModel.h"
#import "ASTDivision.h"


/// Model object for baseball teams.
@interface ASTTeam : ASTModel
/// The team's division.
@property (strong, nonatomic) ASTDivision *division;

/// The team's name.
@property (strong, nonatomic) NSString *name;

/// The team's primary color.
@property (strong, nonatomic) UIColor *color;

/// The team's URL.
@property (strong, nonatomic) NSURL *URL;
@end
