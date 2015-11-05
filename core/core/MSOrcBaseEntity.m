/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOrcBaseEntity.h"

@interface MSOrcBaseEntity()


@end

@implementation MSOrcBaseEntity


- (instancetype)init {
    
    if (self = [super init]) {
        
        _$$$_$$$updatedValues = [[NSMutableSet alloc] init];
    }
    
    return self;
}

- (void) valueChangedFor: (NSString *) property{

}

- (NSMutableDictionary *)getUpdatedValues {
    return nil;
}

@end
