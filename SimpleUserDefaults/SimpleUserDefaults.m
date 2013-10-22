//
// Created by azu on 2013/10/22.
//


#import "SimpleUserDefaults.h"


@interface SimpleUserDefaults ()
@property(nonatomic, strong) NSUserDefaults *userDefaults;
@property(nonatomic, strong) NSMutableArray *observeKeys;
@end

@implementation SimpleUserDefaults
- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    _observeKeys = [NSMutableArray array];

    return self;
}

- (NSUserDefaults *)userDefaults {
    if (_userDefaults == nil) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return _userDefaults;
}

- (NSString *)prefixUserDefaultsKey {
    return [NSStringFromClass([self class]) stringByAppendingString:@"."];
}

- (NSString *)userDefaultsKey:(NSString *) key {
    return [[self prefixUserDefaultsKey] stringByAppendingString:key];
}
#pragma mark - Setters
- (void)setObject:(id) object forKey:(NSString *) key {
    [[self userDefaults] setObject:object forKey:key];
    [[self userDefaults] synchronize];
}

#pragma mark - Getters
- (id)objectForKey:(NSString *) key {
    return [[self userDefaults] objectForKey:key];
}

#pragma mark - Object Subscriting
- (id)objectForKeyedSubscript:(id <NSCopying>) key {
    if ([(NSObject *)key isKindOfClass:[NSString class]]) {
        return [[self userDefaults] objectForKey:(NSString *)key];
    }
    return nil;
}

- (void)setObject:(id) object forKeyedSubscript:(id <NSCopying>) key {
    if ([(NSObject *)key isKindOfClass:[NSString class]]) {
        [[self userDefaults] setObject:object forKey:(NSString *)key];
    }
}
#pragma mark - KVO
- (void)addObserverSelector:(SEL) selector {
    NSString *selectorKey = NSStringFromSelector(selector);
    NSString *keyPath = [self userDefaultsKey:selectorKey];
    id value = [self objectForKey:keyPath];
    if (value != nil) {
        [self setValue:value forKeyPath:selectorKey];
    }
    [self addObserver:self forKeyPath:selectorKey options:NSKeyValueObservingOptionNew context:selector];
    [self.observeKeys addObject:selectorKey];
}

- (void)observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change context:(void *) context {
    [self setObject:change[@"new"] forKey:[self userDefaultsKey:keyPath]];
}

- (void)dealloc {
    for (NSString *key in self.observeKeys) {
        [self removeObserver:self forKeyPath:key];
    }
}

@end