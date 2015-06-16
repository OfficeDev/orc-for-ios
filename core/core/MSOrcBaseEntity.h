//
//  MSOrcBaseEntity.h
//  core
//
//  Created by Gustavo on 6/1/15.
//
//

#import <Foundation/Foundation.h>

@interface MSOrcBaseEntity : NSObject

@property (retain, nonatomic, readonly) NSString *odataType;
@property (retain, nonatomic, readonly, getter=getUpdatedValues) NSMutableDictionary *updatedValues;

-(void)setParent:(MSOrcBaseEntity *)parent forProperty:(NSString *)propertyName;
- (void)valueChanged:(NSObject *)value forProperty:(NSString *)property;
- (NSMutableDictionary *)getUpdatedValues;

@end