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

@synthesize odataType = _odataType;

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

#define VALUE_CHANGED_FOR_TYPE(T,TN)                                                                            \
- (void)valueChangedFor##TN:(T)value forProperty:(NSString *)property{                                          \
                                                                                                                \
    [_$$$_$$$updatedValues setValue:[NSNumber numberWith##TN:value] forKey:property];                           \
                                                                                                                \
    if (_$$$_$$$parent != nil) {                                                                                \
        __strong id sSelf = self;                                                                               \
        NSString *referenceProperty = [_$$$_$$$parent.allKeys objectAtIndex:0];                                 \
        [[_$$$_$$$parent objectForKey:referenceProperty] valueChanged:sSelf forProperty:referenceProperty];     \
    }                                                                                                           \
}

VALUE_CHANGED_FOR_TYPE(bool,Bool)
VALUE_CHANGED_FOR_TYPE(int,Int)
VALUE_CHANGED_FOR_TYPE(double,Double)
VALUE_CHANGED_FOR_TYPE(float,Float)

#undef VALUE_CHANGED_FOR_TYPE


- (NSMutableDictionary *)getUpdatedValues {
    
    return _$$$_$$$updatedValues;
}

@end
