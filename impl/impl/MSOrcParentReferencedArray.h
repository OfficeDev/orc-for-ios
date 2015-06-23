/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import <core/MSOrcBaseEntity.h>

@interface MSOrcParentReferencedArray : MSOrcBaseEntity

- (NSMutableArray *)array;
- (instancetype)initWithOriginalEntity:(NSMutableArray *)originalList
                             andParent:(MSOrcBaseEntity *)parent
                   andReferencePropery:(NSString *)referenceProperty;
@end