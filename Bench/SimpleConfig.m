//
// Created by azu on 2013/10/23.
//


#import "SimpleConfig.h"


@implementation SimpleConfig {

}
- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    [self addObserverSelector:@selector(name)];

    return self;
}

@end