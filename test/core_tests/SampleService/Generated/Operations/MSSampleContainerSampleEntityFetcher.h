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
@class MSSampleContainerSampleEntityFetcher;
@class MSSampleContainerAnotherEntityFetcher;
@class MSSampleContainerAnotherEntityCollectionFetcher;
@class MSSampleContainerItemFetcher;
@class MSSampleContainerItemCollectionFetcher;
@class MSSampleContainerSampleEntityCollectionFetcher;
@class MSSampleContainerSampleEntityOperations;

#import <core/core.h>
#import "MSSampleContainerModels.h"

/**
* The header for type MSSampleContainerSampleEntityFetcher.
*/


@interface MSSampleContainerSampleEntityFetcher : MSOrcEntityFetcher

@property (copy, nonatomic, readonly) MSSampleContainerSampleEntityOperations *operations;

- (instancetype)initWithUrl:(NSString*)urlComponent parent:(id<MSOrcExecutable>)parent;
- (void) readWithCallback:(void (^)(MSSampleContainerSampleEntity *sampleEntity, MSOrcError *error))callback;
- (void)update:(MSSampleContainerSampleEntity *)sampleEntity callback:(void(^)(MSSampleContainerSampleEntity *sampleEntity, MSOrcError *error))callback;
- (void)delete:(void(^)(int status, MSOrcError *error))callback;
- (MSSampleContainerSampleEntityFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSSampleContainerSampleEntityFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;
- (MSSampleContainerSampleEntityFetcher *)select:(NSString *)params;
- (MSSampleContainerSampleEntityFetcher *)expand:(NSString *)value;

@property (retain, nonatomic, readonly, getter=nestedSampleEntity) MSSampleContainerSampleEntityFetcher *nestedSampleEntity;
@property (retain, nonatomic, readonly, getter=navigations) MSSampleContainerAnotherEntityCollectionFetcher *navigations;

- (MSSampleContainerAnotherEntityFetcher *)getNavigationsById:(NSString*)id;

@property (retain, nonatomic, readonly, getter=items) MSSampleContainerItemCollectionFetcher *items;

- (MSSampleContainerItemFetcher *)getItemsById:(NSString*)id;

@property (retain, nonatomic, readonly, getter=nestedSampleEntityCollection) MSSampleContainerSampleEntityCollectionFetcher *nestedSampleEntityCollection;

- (MSSampleContainerSampleEntityFetcher *)getNestedSampleEntityCollectionById:(NSString*)id;


@end