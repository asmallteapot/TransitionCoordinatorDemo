//
//  ASTTeamViewController.h
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASTTeam;


@interface ASTTeamViewController : UIViewController
/// The team to display.
@property (weak, nonatomic) ASTTeam *team;
@end
