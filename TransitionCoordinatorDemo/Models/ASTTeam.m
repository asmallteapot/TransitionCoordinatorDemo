//
//  ASTTeam.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTTeam.h"

/// http://stackoverflow.com/a/12397366/1914
UIColor *UIColorFromHexString(NSString *hexString) {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


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
		return UIColorFromHexString(value);
	} error:error];
}

@end
