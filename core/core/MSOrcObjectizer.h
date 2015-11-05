/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/


#ifndef MSORCOBJECTIZER_H
#define MSORCOBJECTIZER_H

#import <Foundation/Foundation.h>
#import <api/MSOrcInteroperableWithDictionary.h>

/**
 * Converts an MSOrc object or collection of MSOrc objects to/from a dictionary/array representation.
 * It can also directly convert to/from a string if a MSOrcSerializer is used
 */

@interface MSOrcObjectizer : NSObject

+ (id<MSOrcInteroperableWithDictionary>) objectize:(id)dictionaryOrArray toType: (Class) type;
+ (id<MSOrcInteroperableWithDictionary>) objectizeFromString: (NSString *) string toType: (Class) type;

+ (id) deobjectize: (id) obj;
+ (NSString *) deobjectizeToString: (id) obj;

+ (NSString *) stringFromDate: (NSDate *) date;
+ (NSDate *) dateFromString: (NSString *) string;

+ (NSString *) stringFromData: (NSData *) data;
+ (NSData *) dataFromString: (NSString *) string;

+ (NSString *) stringFromTimeInterval: (NSTimeInterval) interval;
+ (NSTimeInterval) timeIntervalFromString: (NSString *) string;


@end 

#endif
