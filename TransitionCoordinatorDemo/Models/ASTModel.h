//
//  ASTModel.h
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+ASTTranslation.h"


/**
 `ASTModel` is an abstract base class for dictionary-backed model objects.
 */
@interface ASTModel : NSObject
/**
 Mutable dictionary for storing unprocessed attributes.
 @discussion In the default implementation, -[ASTModel updateWithAttributes] will merge the incoming attributes with this dictionary by calling -addEntriesFromDictionary: on sourceAttributes. The sourceAttributes dictionary will also be available in the object's description.
 */
@property (strong, nonatomic, readonly) NSMutableDictionary *sourceAttributes;

/**
 Initializes the receiver with attributes from a dictionary.
 @param attributes The attributes to apply.
 @return The initialized model object.
 @param error Pointer to an `NSError *`, which will be set to the error that occurred while applying the attributes, if any.
 @discussion Internally, this just calls -updateWithAttributes:
 */
- (instancetype)initWithAttributes:(NSDictionary *)attributes error:(NSError *__autoreleasing *)error;

/**
 Updates the receiver with attributes from a dictionary.
 @param attributes The attributes to apply.
 @param error Pointer to an `NSError *`, which will be set to the error that occurred while applying the attributes, if any.
 */
- (void)updateWithAttributes:(NSDictionary *)attributes error:(NSError **)error;
@end
