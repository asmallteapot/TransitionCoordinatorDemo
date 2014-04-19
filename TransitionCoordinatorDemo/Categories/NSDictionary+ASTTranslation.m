//
//  NSDictionary+ASTTranslation.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "NSDictionary+ASTTranslation.h"


@implementation NSDictionary (ASTTranslation)

- (id)objectForKey:(id)key ofClass:(Class)expectedClass {
	return [self objectForKey:key ofClass:expectedClass withConversion:NULL error:nil];
}


- (id)objectForKey:(id)key ofClass:(Class)expectedClass withConversion:(ASTTranslationBlock)translationBlock error:(NSError *__autoreleasing *)error {
	id value = [self objectForKey:key];
	if (![value isKindOfClass:expectedClass]) {
		return nil;
	}

	if (translationBlock) {
		value = translationBlock(value, error);
	}

	return value;
}

@end
