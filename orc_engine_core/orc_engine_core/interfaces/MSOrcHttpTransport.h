/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSOrcError.h"

@protocol MSOrcRequest;
@protocol MSOrcResponse;

@protocol MSOrcHttpTransport

- (id<MSOrcRequest>)createRequest;
- (void)executeRequest:(id<MSOrcRequest>)request
              callback:(void (^)(id<MSOrcResponse> response, MSOrcError *error))callback;

@end