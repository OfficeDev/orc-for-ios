/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOrcParentReferencedArray.h"

@interface MSOrcParentReferencedArray()

@property NSMutableArray *theArray;
@property NSString * $$$__$$$referencedProperty;

@end

@implementation MSOrcParentReferencedArray

- (instancetype)initWithOriginalEntity:(NSMutableArray *)originalList
                             andParent:(MSOrcBaseEntity *)parent
                   andReferencePropery:(NSString *)referenceProperty {
    
    if (originalList != nil) {
        self.theArray = originalList;
    }
    else {
        self.theArray = [NSMutableArray array];
    }
    
    [self setParent:parent forProperty:referenceProperty];
    
    return self;
}

-(void)addObject:(id)anObject {
    [self.theArray addObject:anObject];
    [self valueChanged:self forProperty:_$$$__$$$referencedProperty];
}

-(void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    [self.theArray insertObject:anObject atIndex:index];
    [self valueChanged:self forProperty:_$$$__$$$referencedProperty];
}

-(void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    [self.theArray replaceObjectAtIndex:index withObject:anObject];
    [self valueChanged:self forProperty:_$$$__$$$referencedProperty];
}

-(id)objectAtIndex:(NSUInteger)index {
    return [self.theArray objectAtIndex:index];
}

-(void)removeObject:(id)anObject {
    [self.theArray removeObject:anObject];
    [self valueChanged:self forProperty:_$$$__$$$referencedProperty];
}

-(void)removeLastObject {
    [self.theArray removeLastObject];
    [self valueChanged:self forProperty:_$$$__$$$referencedProperty];
}

-(void)removeAllObjects {
    [self.theArray removeAllObjects];
    [self valueChanged:self forProperty:_$$$__$$$referencedProperty];
}

-(void)removeObjectAtIndex:(NSUInteger)index {
    [self.theArray removeObjectAtIndex:index];
    [self valueChanged:self forProperty:_$$$__$$$referencedProperty];
}

- (NSMutableArray *)array{
    return self.theArray;
}

@end