/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT double orc_engine_coreVersionNumber;
FOUNDATION_EXPORT const unsigned char orc_engine_coreVersionString[];

/* Interfaces */

#import <orc_engine_core/MSOrcCredentials.h>
#import <orc_engine_core/MSOrcDependencyResolver.h>
#import <orc_engine_core/MSOrcHttpTransport.h>
#import <orc_engine_core/MSOrcHttpVerb.h>
#import <orc_engine_core/MSOrcJsonSerializer.h>
#import <orc_engine_core/MSOrcLogger.h>
#import <orc_engine_core/MSOrcLogLevel.h>
#import <orc_engine_core/MSOrcRequest.h>
#import <orc_engine_core/MSOrcResponse.h>
#import <orc_engine_core/MSOrcURL.h>

/* Core */

#import <orc_engine_core/MSOrcBaseContainer.h>
#import <orc_engine_core/MSOrcCollectionFetcher.h>
#import <orc_engine_core/MSOrcEntityFetcher.h>
#import <orc_engine_core/MSOrcMultiPartElement.h>
#import <orc_engine_core/MSOrcMultipartCollectionFetcher.h>
#import <orc_engine_core/MSOrcMediaEntityFetcher.h>
#import <orc_engine_core/MSOrcReadable.h>
#import <orc_engine_core/MSOrcExecutable.h>
#import <orc_engine_core/MSOrcOperations.h>
#import <orc_engine_core/MSOrcBaseContainerHelper.h>
#import <orc_engine_core/MSOrcEntityFetcherHelper.h>
#import <orc_engine_core/MSOrcException.h>