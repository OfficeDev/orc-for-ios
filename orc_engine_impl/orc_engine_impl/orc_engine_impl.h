/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT double orc_engine_implVersionNumber;
FOUNDATION_EXPORT const unsigned char orc_engine_implVersionString[];

#import <orc_engine_core/orc_engine_core.h>

#import <orc_engine_impl/MSOrcDefaultDependencyResolver.h>
#import <orc_engine_impl/NSString+NSStringExtensions.h>
#import <orc_engine_impl/MSOrcURLImpl.h>
#import <orc_engine_impl/MSOrcBasicCredentials.h>
#import <orc_engine_impl/MSOrcHttpConnection.h>
#import <orc_engine_impl/MSOrcJsonSerializerImpl.h>
#import <orc_engine_impl/MSOrcLoggerImpl.h>
#import <orc_engine_impl/MSOrcRequestImpl.h>
#import <orc_engine_impl/MSOrcResponseImpl.h>
#import <orc_engine_impl/MSOrcOAuthCredentials.h>
#import <orc_engine_impl/ADALDependencyResolver.h>
#import <orc_engine_impl/LiveDependencyResolver.h>