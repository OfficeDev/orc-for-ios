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



#ifndef MSSAMPLESERVICEITEMFETCHER_H
#define MSSAMPLESERVICEITEMFETCHER_H

#import <orc.h>
#import "MSSampleServiceModels.h"
#import "MSOrcEntityFetcher.h"

@class MSSampleServiceItemAFetcher;	
@class MSSampleServiceItemBFetcher;	
@class MSSampleServiceItemOperations;


/** MSSampleServiceItemFetcher
 *
 */
@interface MSSampleServiceItemFetcher : MSOrcEntityFetcher

@property (copy, nonatomic, readonly) MSSampleServiceItemOperations *operations;

- (instancetype)initWithUrl:(NSString*)urlComponent parent:(id<MSOrcExecutable>)parent;
- (void)readWithCallback:(void (^)(MSSampleServiceItem *, MSOrcError *))callback;
- (void)update:(MSSampleServiceItem *)Item callback:(void (^)(MSSampleServiceItem *, MSOrcError*))callback ;
- (void)delete:(void(^)(int status, MSOrcError *))callback;
- (MSSampleServiceItemFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSSampleServiceItemFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;
- (MSSampleServiceItemFetcher *)select:(NSString *)params;
- (MSSampleServiceItemFetcher *)expand:(NSString *)value;
- (MSSampleServiceItemAFetcher *)asItemA;	
- (MSSampleServiceItemBFetcher *)asItemB;	

@end

#endif
