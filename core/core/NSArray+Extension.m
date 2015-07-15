/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "NSArray+Extension.h"

@interface NSArray()

@property (copy, nonatomic, readwrite) NSString *collectionTypeName;

@end

@implementation NSArray(NSArrayExtension)

- (instancetype)initWithCollectionName:(NSString *)name {
    
    if (self = [self init]) {
        
        self.collectionTypeName = name;
    }
    
    return self;
}

- (NSString *)getCollectionName {
    
    return self.collectionTypeName;
}

@end