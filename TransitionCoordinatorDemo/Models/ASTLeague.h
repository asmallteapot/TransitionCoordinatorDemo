//
//  ASTLeague.h
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTModel.h"


/// Model object for baseball leagues.
@interface ASTLeague : ASTModel
/// The league's name.
@property (strong, nonatomic) NSString *name;

/// The league's URL on Wikipedia.
@property (strong, nonatomic) NSURL *URL;

/// An array containing the league's divisions, which will be ASTDivision instances.
@property (strong, nonatomic) NSArray *divisions;

/// An array containing all available leagues.
+ (NSArray *)allLeagues;
@end
