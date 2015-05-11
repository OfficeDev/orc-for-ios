/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOrcExecutable.h"
#import "MSOrcURL.h"

@class MSOrcOperations;

@protocol MSOrcEntityFetcher <MSOrcExecutable>

@required

- (NSURLSessionTask *)updateEntity:(id)entity
                          callback:(void (^)(id updatedEntity, MSOrcError *error))callback;

- (NSURLSessionTask *)deleteWithCallback:(void (^)(int statusCode, MSOrcError *error))callback;

- (NSURLSessionTask *)updateRaw:(NSString*)payload
                       callback:(void (^)(NSString *response, MSOrcError *error))callback;

@optional

@property (copy, nonatomic, readonly) id operations;

- (id<MSOrcEntityFetcher>)select:(NSString *)params;
- (id<MSOrcEntityFetcher>)expand:(NSString *)value;

+ (void)setPathForCollectionsWithUrl:(id<MSOrcURL>)url
                                 top:(int)top
                                skip:(int)skip
                              select:(NSString *)select
                              expand:(NSString *)expand
                              filter:(NSString *)filter
                             orderby:(NSString *)orderBy
                              search:(NSString *)search;
@end

@interface MSOrcEntityFetcher : MSOrcExecutable<MSOrcEntityFetcher>

@end