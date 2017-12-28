/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/
@class MSSampleContainerItemBFetcher;

#import <core/core.h>
#import "MSSampleContainerModels.h"

/**
* The header for type MSSampleContainerItemBCollectionFetcher.
*/

@interface MSSampleContainerItemBCollectionFetcher : MSOrcCollectionFetcher

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent;

- (MSSampleContainerItemBFetcher *)getById:(NSString *)Id;
- (void)add:(MSSampleContainerItemB *)entity callback:(void (^)(MSSampleContainerItemB *itemB, MSOrcError *error))callback;

- (MSSampleContainerItemBCollectionFetcher *)select:(NSString *)params;
- (MSSampleContainerItemBCollectionFetcher *)filter:(NSString *)params;
- (MSSampleContainerItemBCollectionFetcher *)search:(NSString *)params;
- (MSSampleContainerItemBCollectionFetcher *)top:(int)value;
- (MSSampleContainerItemBCollectionFetcher *)skip:(int)value;
- (MSSampleContainerItemBCollectionFetcher *)expand:(NSString *)value;
- (MSSampleContainerItemBCollectionFetcher *)orderBy:(NSString *)params;
- (MSSampleContainerItemBCollectionFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSSampleContainerItemBCollectionFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;

@end