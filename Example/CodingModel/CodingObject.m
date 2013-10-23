//
// Created by azu on 2013/10/23.
//


#import "CodingObject.h"


@implementation CodingObject {

}
- (id)initWithCoder:(NSCoder *) coder {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    self.name = [coder decodeObjectForKey:@"self.name"];
    self.date = [coder decodeObjectForKey:@"self.date"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *) coder {
    [coder encodeObject:self.name forKey:@"self.name"];
    [coder encodeObject:self.date forKey:@"self.date"];
}

- (BOOL)isEqual:(id) other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToObject:other];
}

- (BOOL)isEqualToObject:(CodingObject *) object {
    if (self == object)
        return YES;
    if (object == nil)
        return NO;
    if (self.name != object.name && ![self.name isEqualToString:object.name])
        return NO;
    if (self.date != object.date && ![self.date isEqualToDate:object.date])
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = [self.name hash];
    hash = hash * 31u + [self.date hash];
    return hash;
}


@end