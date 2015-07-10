
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


@class MSSampleContainerItemAFetcher;
@class MSSampleContainerItemACollectionFetcher;

#import <core/core.h>
#import "MSSampleContainerModels.h"

/**
* The header for type MSSampleContainerItemACollectionFetcher.
*/

@protocol MSSampleContainerItemACollectionFetcherProtocol <MSOrcCollectionFetcher>

@optional

- (void)readWithCallback:(void (^)(NSArray<MSSampleContainerItemA> *itemAs, MSOrcError *error))callback;

- (MSSampleContainerItemACollectionFetcher *)select:(NSString *)params;
- (MSSampleContainerItemACollectionFetcher *)filter:(NSString *)params;
- (MSSampleContainerItemACollectionFetcher *)search:(NSString *)params;
- (MSSampleContainerItemACollectionFetcher *)top:(int)value;
- (MSSampleContainerItemACollectionFetcher *)skip:(int)value;
- (MSSampleContainerItemACollectionFetcher *)expand:(NSString *)value;
- (MSSampleContainerItemACollectionFetcher *)orderBy:(NSString *)params;
- (MSSampleContainerItemACollectionFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSSampleContainerItemACollectionFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;

@required

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent;
- (MSSampleContainerItemAFetcher *)getById:(NSString *)Id;
- (void)add:(MSSampleContainerItemA *)entity callback:(void (^)(MSSampleContainerItemA *itemA, MSOrcError *error))callback;

@end

@interface MSSampleContainerItemACollectionFetcher : MSOrcCollectionFetcher<MSSampleContainerItemACollectionFetcherProtocol>

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent;

@end