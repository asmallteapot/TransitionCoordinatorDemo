//
//  NSDictionary+ASTTranslation.h
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 Block type for converting values from one class to another.
 @param value The incoming value.
 @param error Pointer to an `NSError *`, which will be set to the error that occurred while translating the value, if any.
 @return The converted value.
 */
typedef id (^ASTTranslationBlock)(id value, NSError **error);


/**
 NSDictionary+ASTTranslation provides typesafe value conversions for NSDictionary.
 */
@interface NSDictionary (ASTTranslation)
/**
 Returns the value associated with a given key, if it matches the provided class.
 @param key The key of the object to get.
 @param expectedClass The class of which the associated value is expected to be an instance of.
 @return The object associated with the given key, or nil if the key does not exist, or has a value of a different class.
 */
- (id)objectForKey:(id)key ofClass:(Class)expectedClass;

/**
 Returns the value associated with a given key, as translated by a given block.
 @param key The key of the object to get.
 @param expectedClass The class of which the associated value is expected to be an instance of.
 @param translationBlock A block for converting the value for the associated key to a different class or value.
 @param error Pointer to an `NSError *`, which will be set to the error that occurred while translating the value, if any.
 @return The object associated with the given key, or nil if the key does not exist, or has a value of a different class.
 */
- (id)objectForKey:(id)key ofClass:(Class)expectedClass withConversion:(ASTTranslationBlock)translationBlock error:(NSError **)error;
@end
