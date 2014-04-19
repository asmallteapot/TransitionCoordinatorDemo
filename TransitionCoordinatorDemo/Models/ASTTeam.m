//
//  ASTTeam.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTTeam.h"


@interface ASTTeam ()
@end


@implementation ASTTeam

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@ %p, name = '%@'>", NSStringFromClass([self class]), self, self.name];
}


- (void)updateWithAttributes:(NSDictionary *)attributes error:(NSError *__autoreleasing *)error {
	self.name = [attributes objectForKey:@"name" ofClass:[NSString class]];

	self.URL = [attributes objectForKey:@"url" ofClass:[NSString class] withConversion:^id(id value, NSError *__autoreleasing *error) {
		return [NSURL URLWithString:value];
	} error:error];

	self.color = [attributes objectForKey:@"color" ofClass:[NSString class] withConversion:^id(id value, NSError *__autoreleasing *error) {
#warning TODO parse colors
		return nil;
	} error:error];
}

@end
