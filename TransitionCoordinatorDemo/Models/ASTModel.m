//
//  ASTModel.m
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import "ASTModel.h"


@interface ASTModel ()
/// Internal readwrite declaration.
@property (strong, nonatomic, readwrite) NSMutableDictionary *sourceAttributes;
@end


@implementation ASTModel

- (instancetype)init {
	self = [super init];
	if (self) {
		self.sourceAttributes = [[NSMutableDictionary alloc] init];
	}
	return self;
}


- (instancetype)initWithAttributes:(NSDictionary *)attributes error:(NSError *__autoreleasing *)error {
	self = [super init];
	if (self) {
		[self updateWithAttributes:attributes error:error];
	}
	return self;
}


- (NSString *)description {
	return [NSString stringWithFormat:@"<%@ %p, sourceAttributes = %@>", NSStringFromClass([self class]), self, self.sourceAttributes];
}


- (void)updateWithAttributes:(NSDictionary *)attributes error:(NSError *__autoreleasing *)error {
	[self.sourceAttributes addEntriesFromDictionary:attributes];
}

@end
