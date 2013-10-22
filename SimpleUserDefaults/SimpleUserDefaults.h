//
// Created by azu on 2013/10/22.
//


#import <Foundation/Foundation.h>


@interface SimpleUserDefaults : NSObject
#pragma mark - Config
- (NSString *)prefixUserDefaultsKey;
#pragma mark - Observer
- (void)addObserverSelector:(SEL) selector;
@end