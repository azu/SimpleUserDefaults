//
// Created by azu on 2013/10/22.
//


#import <Foundation/Foundation.h>


@interface SimpleUserDefaults : NSObject

- (NSString *)prefixUserDefaultsKey;

- (void)setObject:(id) object forKey:(NSString *) key;

- (void)removeObjectForKey:(NSString *) key;

- (id)objectForKey:(NSString *) key;

- (id)objectForKeyedSubscript:(id <NSCopying>) key;

- (void)setObject:(id) object forKeyedSubscript:(id <NSCopying>) key;

- (void)addObserverSelector:(SEL) selector;
@end