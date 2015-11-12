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



#ifndef MSSAMPLESERVICEITEMAFETCHER_H
#define MSSAMPLESERVICEITEMAFETCHER_H

#import "MSSampleServiceModels.h"
#import "api/api.h"
#import "core/MSOrcEntityFetcher.h"

@class MSSampleServiceItemAOperations;


/** MSSampleServiceItemAFetcher
 *
 */
@interface MSSampleServiceItemAFetcher : MSOrcEntityFetcher

@property (copy, nonatomic, readonly) MSSampleServiceItemAOperations *operations;

- (instancetype)initWithUrl:(NSString*)urlComponent parent:(id<MSOrcExecutable>)parent;
- (void)readWithCallback:(void (^)(MSSampleServiceItemA *, MSOrcError *))callback;
- (void)update:(MSSampleServiceItemA *)ItemA callback:(void (^)(MSSampleServiceItemA *, MSOrcError*))callback ;
- (void)delete:(void(^)(int status, MSOrcError *))callback;
- (MSSampleServiceItemAFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSSampleServiceItemAFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;
- (MSSampleServiceItemAFetcher *)select:(NSString *)params;
- (MSSampleServiceItemAFetcher *)expand:(NSString *)value;

@end

#endif
