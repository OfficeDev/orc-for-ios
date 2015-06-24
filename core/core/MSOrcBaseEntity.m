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

//NSMutableDictionary *_updatedValues;

@synthesize odataType = _odataType;

//@synthesize updatedValues = _updatedValues;

- (instancetype)init {
    
    if (self = [super init]) {
        
        _$$$_$$$updatedValues = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)setOdataType:(NSString *)odataType {
    _odataType = odataType;
    
    [self valueChanged:odataType forProperty:@"odataType"];
}

- (void)setParent:(MSOrcBaseEntity *)parent forProperty:(NSString *)propertyName {
    _$$$_$$$parent = [NSDictionary dictionaryWithObject:parent forKey:propertyName];
}

- (void)valueChanged:(NSObject *)value forProperty:(NSString *)property{
    
    [_$$$_$$$updatedValues setValue:value forKey:property];
    
    if (_$$$_$$$parent != nil) {
        __strong id sSelf = self;
        NSString *referenceProperty = [_$$$_$$$parent.allKeys objectAtIndex:0];
        [[_$$$_$$$parent objectForKey:referenceProperty] valueChanged:sSelf forProperty:referenceProperty];
    }
}

- (NSMutableDictionary *)getUpdatedValues {
    
    return _$$$_$$$updatedValues;
}

@end