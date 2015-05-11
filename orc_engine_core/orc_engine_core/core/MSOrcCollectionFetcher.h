/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOrcExecutable.h"
#import "MSOrcEntityFetcher.h"
#import "MSOrcDependencyResolver.h"

#define __message_msg(message)

@protocol MSOrcCollectionFetcher<MSOrcExecutable>

@optional
- (id<MSOrcCollectionFetcher>)addCustomParametersWithName:(NSString *)name value:(id)value;
- (id<MSOrcCollectionFetcher>)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;

@end

@interface MSOrcCollectionFetcher : MSOrcExecutable<MSOrcCollectionFetcher>

- (MSOrcCollectionFetcher *)select:(NSString *)params;
- (MSOrcCollectionFetcher *)filter:(NSString *)params;
- (MSOrcCollectionFetcher *)top:(int)value;
- (MSOrcCollectionFetcher *)skip:(int)value;
- (MSOrcCollectionFetcher *)expand:(NSString *)value;
- (MSOrcCollectionFetcher *)orderBy:(NSString *)params;
- (MSOrcCollectionFetcher *)search:(NSString *)params;

- (NSURLSessionTask *)add:(id)entity callback:(void (^)(id entityAdded, MSOrcError *error))callback;

- (MSOrcEntityFetcher *)getById:(NSString *)theId;

- (NSURLSessionTask *)count:(void (^)(NSInteger result, MSOrcError *error))callback; __message_msg("This method will override all the odata operators -> select, top, filter, orderby, skip, expand.");

- (NSURLSessionTask *)addRaw:(NSString *)payload callback:(void (^)(NSString *result, MSOrcError *error))callback;
    
@end
