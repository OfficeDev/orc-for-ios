//
//  MSOrcParentReferencedList.h
//  impl
//
//  Created by Anahi Hojnadel on 6/18/15.
//
//

#import <Foundation/Foundation.h>
#import <core/MSOrcBaseEntity.h>

@interface MSOrcParentReferencedList : NSMutableArray
    
    // Backend instance your class will be using
@property MSOrcBaseEntity *parent;
@property NSString *referencedProperty;

- (instancetype)initWithOriginalEntity:(NSMutableArray *)originalList
                  andParent: (MSOrcBaseEntity *) parent
                  andReferencePropery:(NSString *)referenceProperty;
@end