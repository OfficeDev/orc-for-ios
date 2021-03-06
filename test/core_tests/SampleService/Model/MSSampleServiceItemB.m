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



/** Implementation for MSSampleServiceItemB
 *
 */
@implementation MSSampleServiceItemB


@synthesize odataType = _odataType;


+ (NSDictionary *) $$$_$$$propertiesNamesMappings
{
    static NSDictionary *_$$$_$$$propertiesNamesMappings=nil; 
    
    if(_$$$_$$$propertiesNamesMappings==nil){
    _$$$_$$$propertiesNamesMappings=[[NSDictionary alloc] initWithObjectsAndKeys:  @"PropertyB", @"propertyB", @"ItemName", @"itemName", @"Id", @"_id", nil];
    
    }
    
    return _$$$_$$$propertiesNamesMappings;
}

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.SampleService.ItemB";
        
    }

	return self;
}



- (instancetype) initWithDictionary: (NSDictionary *) dic {
    if((self = [self init])) {
    
		_propertyB = [dic objectForKey: @"PropertyB"] != nil ? [[dic objectForKey: @"PropertyB"] copy] : _propertyB;
		self.itemName = [dic objectForKey: @"ItemName"] != nil ? [[dic objectForKey: @"ItemName"] copy] : self.itemName;
		self._id = [dic objectForKey: @"Id"] != nil ? [[dic objectForKey: @"Id"] copy] : self._id;

    [self.updatedValues removeAllObjects];
    }
    
    return self;
}

- (NSDictionary *) toDictionary {
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];

	{id curVal = [self.propertyB copy];if (curVal!=nil) [dic setValue: curVal forKey: @"PropertyB"];}
	{id curVal = [self.itemName copy];if (curVal!=nil) [dic setValue: curVal forKey: @"ItemName"];}
	{id curVal = [self._id copy];if (curVal!=nil) [dic setValue: curVal forKey: @"Id"];}
    [dic setValue: @"#Microsoft.SampleService.ItemB" forKey: @"@odata.type"];

    return dic;
}

- (NSDictionary *) toUpdatedValuesDictionary {
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];

	{id curVal = self.propertyB;
    if([self.updatedValues containsObject:@"PropertyB"])
    {
                [dic setValue: curVal==nil?[NSNull null]:[curVal copy] forKey: @"PropertyB"];
            }
    }
	{id curVal = self.itemName;
    if([self.updatedValues containsObject:@"ItemName"])
    {
                [dic setValue: curVal==nil?[NSNull null]:[curVal copy] forKey: @"ItemName"];
            }
    }
	{id curVal = self._id;
    if([self.updatedValues containsObject:@"Id"])
    {
                [dic setValue: curVal==nil?[NSNull null]:[curVal copy] forKey: @"Id"];
            }
    }
    return dic;
}


/** Setter implementation for property propertyB
 *
 */
- (void) setPropertyB: (NSString *) value {
    _propertyB = value;
    [self valueChangedFor:@"PropertyB"];
}
       

@end
