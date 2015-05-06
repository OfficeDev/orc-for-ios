/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOrcDependencyResolver.h"
#import "MSOrcError.h"

@protocol MSOrcReadable

@optional

- (NSURLSessionTask *)readWithCallback:(void (^)(id response, MSOrcError *error))callback;
- (NSURLSessionTask *)readRawWithCallback:(void (^)(NSString *responseString, MSOrcError *error))callback;

@end