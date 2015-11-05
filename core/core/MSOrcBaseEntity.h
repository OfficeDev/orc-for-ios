/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@interface MSOrcBaseEntity : NSObject 

@property (retain, nonatomic) NSString *odataType;

/* $$$_$$$ char for not beeing serialized and prevent naming colision */
@property (retain, nonatomic, readonly) NSMutableSet *$$$_$$$updatedValues;

- (NSMutableDictionary *)getUpdatedValues;

- (void)valueChangedFor: (NSString *) property;


@end
