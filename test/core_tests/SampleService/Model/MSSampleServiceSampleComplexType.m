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



#import "MSSampleServiceModels.h"
#import "core/MSOrcObjectizer.h"


/** Implementation for MSSampleServiceSampleComplexType
 *
 */
@implementation MSSampleServiceSampleComplexType


@synthesize odataType = _odataType;

+ (NSDictionary *) $$$_$$$propertiesNamesMappings
{
    static NSDictionary *_$$$_$$$propertiesNamesMappings=nil; 
    
    if(_$$$_$$$propertiesNamesMappings==nil){
    _$$$_$$$propertiesNamesMappings=[[NSDictionary alloc] initWithObjectsAndKeys:  @"Name", @"name", @"AnotherProperty", @"anotherProperty", nil];
    
    }
    
    return _$$$_$$$propertiesNamesMappings;
}


- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.SampleService.SampleComplexType";

    }

	return self;
}


- (instancetype) initWithDictionary: (NSDictionary *) dic {
    if((self = [self init])) {
    
		_name = [dic objectForKey: @"Name"] != nil ? [[dic objectForKey: @"Name"] copy] : _name;
		_anotherProperty = [dic objectForKey: @"AnotherProperty"] != nil ? [[dic objectForKey: @"AnotherProperty"] copy] : _anotherProperty;

    [self.updatedValues removeAllObjects];
    }
    
    return self;
}

- (NSDictionary *) toDictionary {
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];

	{id curVal = [self.name copy];if (curVal!=nil) [dic setValue: curVal forKey: @"Name"];}
	{id curVal = [self.anotherProperty copy];if (curVal!=nil) [dic setValue: curVal forKey: @"AnotherProperty"];}
    [dic setValue: @"#Microsoft.SampleService.SampleComplexType" forKey: @"@odata.type"];

    return dic;
}

- (NSDictionary *) toUpdatedValuesDictionary {
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];

	{id curVal = self.name;
    if([self.updatedValues containsObject:@"Name"])
    {
                [dic setValue: curVal==nil?[NSNull null]:[curVal copy] forKey: @"Name"];
            }
    }
	{id curVal = self.anotherProperty;
    if([self.updatedValues containsObject:@"AnotherProperty"])
    {
                [dic setValue: curVal==nil?[NSNull null]:[curVal copy] forKey: @"AnotherProperty"];
            }
    }
    return dic;
}


/** Setter implementation for property name
 *
 */
- (void) setName: (NSString *) value {
    _name = value;
    [self valueChangedFor:@"Name"];
}
       
/** Setter implementation for property anotherProperty
 *
 */
- (void) setAnotherProperty: (NSString *) value {
    _anotherProperty = value;
    [self valueChangedFor:@"AnotherProperty"];
}
       

@end
