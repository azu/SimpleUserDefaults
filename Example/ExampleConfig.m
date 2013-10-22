//
// Created by azu on 2013/10/22.
//


#import "ExampleConfig.h"


@implementation ExampleConfig {

}


- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    [self addObserverSelector:@selector(name)];
    [self addObserverSelector:@selector(hasBoolValue)];

    return self;
}

@end