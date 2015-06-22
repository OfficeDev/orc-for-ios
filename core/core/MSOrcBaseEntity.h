/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@interface MSOrcBaseEntity : NSObject

@property (retain, nonatomic, readonly) NSString *odataType;
@property (retain, nonatomic, readonly, getter=getUpdatedValues) NSMutableDictionary *updatedValues;

- (void)setParent:(MSOrcBaseEntity *)parent forProperty:(NSString *)propertyName;
- (void)valueChanged:(NSObject *)value forProperty:(NSString *)property;
- (NSMutableDictionary *)getUpdatedValues;

@end