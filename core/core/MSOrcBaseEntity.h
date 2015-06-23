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
- (void)valueChanged:(NSObject *)value forProperty:(NSString *)property;
- (NSMutableDictionary *)getUpdatedValues;
- (NSMutableDictionary *)getUpdatedValues;
@end