//
//  ASTLeague.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTLeague.h"
#import "ASTDivision.h"


@interface ASTLeague ()
@end


@implementation ASTLeague

+ (NSArray *)allLeagues {
	static NSArray *allLeagues;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		// Load all data from the JSON file
		NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"mlb" withExtension:@"json"];
		NSData *data = [NSData dataWithContentsOfURL:fileURL];
		NSDictionary *JSONObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
		NSMutableArray *leagues = [[NSMutableArray alloc] init];
		for (NSDictionary *rawLeague in JSONObject[@"leagues"]) {
			ASTLeague *league = [[ASTLeague alloc] initWithAttributes:rawLeague error:nil];
			[leagues addObject:league];
		}
		allLeagues = leagues;
	});
	return allLeagues;
}


- (NSString *)description {
	return [NSString stringWithFormat:@"<%@ %p, name = '%@', divisions = %@>", NSStringFromClass([self class]), self, self.name, self.divisions];
}


- (void)updateWithAttributes:(NSDictionary *)attributes error:(NSError *__autoreleasing *)error {
	self.name = [attributes objectForKey:@"name" ofClass:[NSString class]];

	self.URL = [attributes objectForKey:@"url" ofClass:[NSString class] withConversion:^id(id value, NSError *__autoreleasing *error) {
		return [NSURL URLWithString:value];
	} error:error];

	self.divisions = [attributes objectForKey:@"divisions" ofClass:[NSArray class] withConversion:^id(NSArray *rawDivisions, NSError *__autoreleasing *error) {
		NSMutableArray *divisions = [[NSMutableArray alloc] initWithCapacity:[rawDivisions count]];
		for (NSDictionary *rawDivision in rawDivisions) {
			ASTDivision *division = [[ASTDivision alloc] initWithAttributes:rawDivision error:error];
			division.league = self;
			[divisions addObject:division];
		}
		return divisions;
	} error:error];
}

@end
