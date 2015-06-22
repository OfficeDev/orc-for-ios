/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOrcJsonSerializerImpl.h"
#import "MSOJsonParser.h"
#import "impl.h"
#import "Property.h"
#import <objc/runtime.h>

@interface MSOrcJsonSerializerImpl()

@property (copy, nonatomic, readonly) MSOJsonParser *parser;

@end

@implementation MSOrcJsonSerializerImpl

- (instancetype)init {
    
    if (self = [super init]) {
        
        NSDictionary *metadataValues = [[NSDictionary alloc] initWithObjectsAndKeys:
                                        @"odataType", @"@odata.type",
                                        @"$$__self", @"self",
                                        @"$$__description", @"description",
                                        @"$$__default",@"default", nil];
        
        _parser = [[MSOJsonParser alloc] initWithMetadataValues:metadataValues];
    }

    return self;
}

- (NSString *)serialize:(id)objectToSerialize {
    
    return [self.parser toJsonString:objectToSerialize];
}

- (NSString *)serialize:(id)objectToSerialize property:(NSString *)name {
    
    return [self.parser toJsonString:objectToSerialize Property:name];
}

- (id)deserialize:(NSData *)serializedObject asClass:(Class)theClass {

    id entity = [self.parser parseWithData:serializedObject forType:theClass selector:nil];
    
    [self referenceParents:entity parent:nil :nil ];
    
    return entity;
}

- (id)deserializeList:(NSData *)serializedList asClass:(Class)theClass {
    
    NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];
    
    
    return [self.parser parseWithData:serializedList forType:theClass selector:selectors];
}

-(NSString *)dictionaryToJsonString:(NSDictionary *)dictionary {
    
    return [self.parser dictionaryToJsonString:dictionary];
}

- (void) referenceParents: (NSObject*) objToAnalyze parent: (id) theParent : (NSString*) referencePropery{
    if(objToAnalyze == nil){
        return;
    }
    
    if([objToAnalyze isMemberOfClass:[ MSOrcParentReferencedList class]]){
        MSOrcParentReferencedList *list = (MSOrcParentReferencedList*) objToAnalyze;
        for(NSObject *subObject in list){
            [self referenceParents:subObject parent:theParent :referencePropery];
        }
    }
    if([objToAnalyze isMemberOfClass:[ NSMutableArray class]]){
        NSMutableArray *list = (NSMutableArray*) objToAnalyze;
        for(NSObject *subObject in list){
            [self referenceParents:subObject parent:theParent :referencePropery];
        }
    }else if([objToAnalyze isKindOfClass:[MSOrcBaseEntity class]])
    {
        MSOrcBaseEntity *entity = (MSOrcBaseEntity*) objToAnalyze;
        
        if(theParent != nil){
            [entity setParent:theParent forProperty:referencePropery];
        }
        
        NSArray *properties = [self getPropertiesFor:[objToAnalyze class]];
        
        for (Property* property in properties) {
            NSObject *value = [objToAnalyze valueForKey:property.Name];
            if([value isKindOfClass:[NSMutableArray class]] && ![value isMemberOfClass:[ MSOrcParentReferencedList class]]){
                MSOrcParentReferencedList *wrappedList = [[MSOrcParentReferencedList alloc] initWithOriginalEntity:(NSMutableArray*)value andParent:entity andReferencePropery:property.Name];
                [entity setValue:wrappedList forKey:property.Name];
                [self referenceParents:wrappedList parent:wrappedList :nil];
                
            }else{

                [self referenceParents:value parent:entity :property.Name];
            }
        }
        
            
    }
}

-(NSMutableArray*)getPropertiesFor : (Class)type {
    NSMutableArray* result = [NSMutableArray array];
    
    Class class = type;
    
    do {
        unsigned int count, i;
        objc_property_t *properties = class_copyPropertyList(class, &count);
        
        for (i = 0; i < count; i++) {
            
            Property * property = [[Property alloc]initWith:properties[i]];
            
            [result addObject:property];
        }
        
        free(properties);
        class = [class superclass];
    } while ([class superclass]);
    
    return result;
}


//referenceParent method

// ParentReferendecList class

@end

