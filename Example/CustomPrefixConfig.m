//
// Created by azu on 2013/10/22.
//


#import "CustomPrefixConfig.h"


@implementation CustomPrefixConfig {

}

- (NSString *)prefixUserDefaultsKey {
    return @"CustomPrefix.";
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