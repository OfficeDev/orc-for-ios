/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#include "core/MSOrcChangesTrackingArray.h"

@implementation MSOrcChangesTrackingArray

- (ObjectType)objectAtIndex:(NSUInteger)index {
    return [super objectAtIndex:index];
}

- (void)addObject:(ObjectType)anObject {
    changed=true;
    [super addObject:anObject];
}

- (void)insertObject:(ObjectType)anObject atIndex:(NSUInteger)index {
    changed=true;
    [super insertObject: anObject atIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject {
    changed=true;
    [super replaceObjectAtIndex:index withObject:anObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    changed=true;
    [super removeObjectAtIndex: index];
}

- (void)removeLastObject {
    changed=true;
    [super removeLastObject];
}

- (void)resetChangedFlag {
    changed=false;
}

@end