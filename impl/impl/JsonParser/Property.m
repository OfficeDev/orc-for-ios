/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "Property.h"
#import "NSArray+Extension.h"
@implementation Property

-(id)initWith : (objc_property_t)property{
    
    NSString *typeString = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
    NSArray *attributes = [typeString componentsSeparatedByString:@","];
    
    self.Type = [attributes objectAtIndex:0];
    self.Name = [NSString  stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
    
    if([self.Name containsString:@"$$$_$$$"]) return nil;
    
    if ([self isComplexType]) {
        self.SubStringType = [self.Type substringWithRange:NSMakeRange(3, [self.Type length] -4)];
    }
    return self;
}

-(BOOL)isString{
    return [self.SubStringType isEqualToString:@"NSString"];
}

-(BOOL)isNumber{
    return [self.SubStringType isEqualToString:@"NSInteger"];
}

-(BOOL)isDate{
    return [self.SubStringType isEqualToString:@"NSDate"];
}

-(BOOL)isNSData{
    return [self.SubStringType isEqualToString:@"NSData"];
}

-(BOOL)isBoolean{
    return (strcmp([[self.Type substringWithRange:NSMakeRange(1, 1)] cStringUsingEncoding:NSASCIIStringEncoding], @encode(BOOL)) == 0);
}

-(BOOL)isEnum{
    return [self.Type isEqualToString:@"Tq"] ;//]|| [self.Type isEqualToString:@"Ti"];
}

- (BOOL)isStream{
    return [self.SubStringType isEqualToString:@"NSStream"];
}

- (BOOL)isCollection{
    return [self.SubStringType hasPrefix:@"NSMutableArray"] ||
    [self.SubStringType hasPrefix:@"NSArray"] ||
    [self.SubStringType hasPrefix:@"NSDictionary"];
}

- (BOOL)isCustomArray {
    return [self.SubStringType hasPrefix:@"MSOrcParentReferencedArray"];
}

- (NSString *)getCollectionEntity:(id)entity{
    
    if ([self isCollection]) {
        
        return objc_getAssociatedObject(entity, NSSelectorFromString(@"typeName"));
    }
    else{
        return nil;
    }
}

- (BOOL)isComplexType{
    return [self.Type hasPrefix:@"T@"];
}

- (NSString *)getPrivateKey {
    return [NSString stringWithFormat:@"_%@%@", [[self.Name substringToIndex:1] lowercaseString], [self.Name substringFromIndex:1]];
}

@end