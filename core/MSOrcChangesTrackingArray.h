/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@interface MSOrcChangesTrackingArray : NSMutableArray

@property(readonly) NSUInteger count;

- (ObjectType)objectAtIndex:(NSUInteger)index;

- (void)addObject:(ObjectType)anObject;

- (void)insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject;

- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)removeLastObject;

- (void)resetChangedFlag;

@private

bool changed;


@end