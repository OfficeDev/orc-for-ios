/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@interface MSOrcBaseEntity : NSObject

@property (retain, nonatomic, readonly) NSString *odataType;



/* $$$_$$$ char for not beeing serialized and prevent naming colision */

@property (retain, nonatomic, readonly) NSDictionary *$$$_$$$parent;
@property (retain, nonatomic, readonly) NSMutableDictionary *$$$_$$$updatedValues;

- (void)setParent:(MSOrcBaseEntity *)parent forProperty:(NSString *)propertyName;
- (NSMutableDictionary *)getUpdatedValues;

- (void)valueChanged:(NSObject *)value forProperty:(NSString *)property;

#define VALUE_CHANGED_FOR_TYPE(T,TN) - (void)valueChangedFor##TN:(T)value forProperty:(NSString *)property;

VALUE_CHANGED_FOR_TYPE(bool,Bool)
VALUE_CHANGED_FOR_TYPE(int,Int)
VALUE_CHANGED_FOR_TYPE(double,Double)
VALUE_CHANGED_FOR_TYPE(float,Float)

#undef VALUE_CHANGED_FOR_TYPE

@end
