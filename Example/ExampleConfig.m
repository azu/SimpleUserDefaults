//
// Created by azu on 2013/10/22.
//


#import "ExampleConfig.h"
#import "CodingObject.h"

@interface ExampleConfig ()
// Custom Object saved as NSData
@property(nonatomic) NSData *codingObjectData;
@end

@implementation ExampleConfig {
}


- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    [self addObserverSelector:@selector(name)];
    [self addObserverSelector:@selector(codingObjectData)];
    [self addObserverSelector:@selector(hasBoolValue)];
    return self;
}

// Case NSCoding object, manually implement getter/setter
- (void)setCodingObject:(CodingObject *) codingObject {
    self.codingObjectData = [NSKeyedArchiver archivedDataWithRootObject:codingObject];
}

- (CodingObject *)codingObject {
    return [NSKeyedUnarchiver unarchiveObjectWithData:self.codingObjectData];
}

@end