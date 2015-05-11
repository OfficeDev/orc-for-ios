/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOrcDependencyResolver.h"
#import "MSOrcReadable.h"
#import "MSOrcResponse.h"
#import "MSOrcError.h"

@protocol MSOrcExecutable<MSOrcReadable>

@optional

@property (copy, nonatomic, readonly) id<MSOrcDependencyResolver> resolver;

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent asClass:(Class)entityClass;

- (NSURLSessionTask *)orcExecuteRequest:(id<MSOrcRequest>)request callback:(void (^)(id<MSOrcResponse> response, MSOrcError *error))callback;

- (id<MSOrcExecutable>)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;
- (id<MSOrcExecutable>)addCustomParametersWithName:(NSString *)name value:(NSString *)value;

@required

@property (copy, nonatomic, readonly) NSString *urlComponent;
@property (copy, nonatomic, readonly) id<MSOrcExecutable> parent;
@property (copy, nonatomic, readonly) Class entityClass;

@end

@interface MSOrcExecutable : NSObject<MSOrcExecutable>

@property (copy, nonatomic, readonly) NSMutableDictionary *customParameters;
@property (copy, nonatomic, readonly) NSMutableDictionary *customHeaders;

@end