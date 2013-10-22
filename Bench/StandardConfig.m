//
// Created by azu on 2013/10/23.
//


#import "StandardConfig.h"


@implementation StandardConfig {
}

- (NSString *)name {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
}

- (void)setName:(NSString *) name {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:name forKey:@"name"];
    [defaults synchronize];
}

@end