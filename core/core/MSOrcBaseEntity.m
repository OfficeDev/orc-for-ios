/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOrcBaseEntity.h"

@interface MSOrcBaseEntity()

@property (retain, nonatomic, readonly) NSDictionary *parent;

@end

@implementation MSOrcBaseEntity

@synthesize odataType = _odataType;
@synthesize parent = _parent;
@synthesize updatedValues = _updatedValues;

- (instancetype)init {

    if (self = [super init]) {
        
        _updatedValues = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)setOdataType:(NSString *)odataType {
    _odataType = odataType;
    
    [self valueChanged:odataType forProperty:@"odataType"];
}

- (void)setParent:(MSOrcBaseEntity *)parent forProperty:(NSString *)propertyName {
    _parent = [NSDictionary dictionaryWithObject:parent forKey:propertyName];
}

- (void)valueChanged:(NSObject *)value forProperty:(NSString *)property{
    
    [_updatedValues setValue:value forKey:property];
    
    if (_parent != nil) {
        NSString *referenceProperty = [_parent.allKeys objectAtIndex:0];
        [[_parent objectForKey:referenceProperty] valueChanged:self forProperty:referenceProperty];
    }
}

- (NSMutableDictionary *)getUpdatedValues {
    
    return _updatedValues;
}

@end