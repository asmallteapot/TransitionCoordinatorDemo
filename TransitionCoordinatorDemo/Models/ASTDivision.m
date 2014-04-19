//
//  ASTDivision.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTDivision.h"
#import "ASTTeam.h"


@interface ASTDivision ()
@end


@implementation ASTDivision

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@ %p, name = '%@', teams = %@>", NSStringFromClass([self class]), self, self.name, self.teams];
}


- (void)updateWithAttributes:(NSDictionary *)attributes error:(NSError *__autoreleasing *)error {
	self.name = [attributes objectForKey:@"name" ofClass:[NSString class]];

	self.URL = [attributes objectForKey:@"url" ofClass:[NSString class] withConversion:^id(id value, NSError *__autoreleasing *error) {
		return [NSURL URLWithString:value];
	} error:error];

	self.teams = [attributes objectForKey:@"teams" ofClass:[NSArray class] withConversion:^id(NSArray *rawTeams, NSError *__autoreleasing *error) {
		NSMutableArray *teams = [[NSMutableArray alloc] initWithCapacity:[rawTeams count]];
		for (NSDictionary *rawTeam in rawTeams) {
			ASTTeam *team = [[ASTTeam alloc] initWithAttributes:rawTeam error:error];
			team.division = self;
			[teams addObject:team];
		}
		return teams;
	} error:error];
}

@end
