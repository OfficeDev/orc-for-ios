//
//  MSOrcParentReferencedList.m
//  impl
//
//
//

#import "MSOrcParentReferencedList.h"

@implementation MSOrcParentReferencedList

- (instancetype)initWithOriginalEntity:(NSMutableArray *)originalList
                            andParent: (MSOrcBaseEntity *) parent
                            andReferencePropery:(NSString *)referenceProperty{
    
    if(originalList != nil){
        self = [super initWithArray:originalList];
    }else{
        self = [super init];
    }
    _parent = parent;
    _referencedProperty = referenceProperty;
    
    return self;
}

-(instancetype)init {
    
    if (self = [super init]) {
        //self = [@[] mutableCopy];
    }
    
    return self;
}

-(void)addObject:(id)anObject {
    [self addObject:anObject];
    [_parent valueChanged:self forProperty:_referencedProperty];
}

-(void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    [self insertObject:anObject atIndex:index];
    [_parent valueChanged:self forProperty:_referencedProperty];
}

-(void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    [self replaceObjectAtIndex:index withObject:anObject];
    [_parent valueChanged:self forProperty:_referencedProperty];
}

-(id)objectAtIndex:(NSUInteger)index {
    return [self objectAtIndex:index];
}

-(void)removeObject:(id)anObject {
    [self removeObject:anObject];
    [_parent valueChanged:self forProperty:_referencedProperty];
}

-(void)removeLastObject {
    [self removeLastObject];
    [_parent valueChanged:self forProperty:_referencedProperty];
}

-(void)removeAllObjects {
    [self removeAllObjects];
    [_parent valueChanged:self forProperty:_referencedProperty];
}

-(void)removeObjectAtIndex:(NSUInteger)index {
    [self removeObjectAtIndex:index];
    [_parent valueChanged:self forProperty:_referencedProperty];
}

@end