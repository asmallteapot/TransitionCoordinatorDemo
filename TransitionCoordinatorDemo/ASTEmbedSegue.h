//
//  ASTEmbedSegue.h
//  TransitionCoordinatorDemo
//
//  Created by Bill Williams on 18.04.14.
//  Copyright (c) 2014 A Small Teapot. All rights reserved.
//

#import <UIKit/UIKit.h>


/// Segue for embeding view controllers in a container.
@interface ASTEmbedSegue : UIStoryboardSegue
@end


/// Protocol for an embed segue's source view controller
@protocol ASTEmbedSegueSource <NSObject>
/**
 Returns the container view for a given embed segue.
 @param segue The embed segue for which to provide a container view.
 @return A view in which to embed the segue's destination view controller.
 */
- (UIView *)containerViewForEmbedSegue:(ASTEmbedSegue *)segue;
@end
