/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOrcExecutable.h"
#import "MSOrcCollectionFetcher.h"
#import "MSOrcMediaEntityFetcher.h"
#import "MSOrcMultiPartElement.h"

@protocol MSOrcMultipartCollectionFetcher<MSOrcCollectionFetcher>

@optional

- (instancetype)initWithUrl:(NSString *)urlComponent
                     parent:(id<MSOrcExecutable>)parent
                    asClass:(Class)theClass;

- (NSURLSessionTask *)addParts:(NSArray<MSOrcMultiPartElement> *)parts
                  withCallback:(void (^)(id<MSOrcResponse> response, MSOrcError *error))callback;

- (MSOrcMediaEntityFetcher *)getById:(NSString *)Id;

@end

@interface MSOrcMultipartCollectionFetcher : MSOrcCollectionFetcher<MSOrcMultipartCollectionFetcher>

@end