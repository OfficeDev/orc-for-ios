//
//  MSOrcBaseEntity.m
//  core
//
//  Created by Gustavo on 6/1/15.
//
//

#import "MSOrcBaseEntity.h"

@interface MSOrcBaseEntity()

@property (retain, nonatomic, readonly) NSDictionary *parent;

@end

@implementation MSOrcBaseEntity

@synthesize odataType = _odataType;
@synthesize parent = _parent;
@synthesize updatedValues = _updatedValues;

- (instancetype)init {

    if (self = [super init]) {
        
        _updatedValues = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)setOdataType:(NSString *)odataType {
    _odataType = odataType;
    
    [self valueChanged:odataType forProperty:@"odataType"];
}

-(void)setParent:(MSOrcBaseEntity *)parent forProperty:(NSString *)propertyName {
    _parent = [NSDictionary dictionaryWithObject:parent forKey:propertyName];
}

- (void)valueChanged:(NSObject *)value forProperty:(NSString *)property{
    
    [_updatedValues setValue:value forKey:property];
    
    if (_parent != nil) {
        NSString *referenceProperty = [_parent.allKeys objectAtIndex:0];
        [[_parent objectForKey:referenceProperty] valueChanged:self forProperty:referenceProperty];
    }
}

- (NSMutableDictionary *)getUpdatedValues {
    
    return _updatedValues;
}

@end
