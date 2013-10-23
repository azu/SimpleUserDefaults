//
// Created by azu on 2013/10/23.
//


#import <Foundation/Foundation.h>


@interface CodingObject : NSObject <NSCoding>
@property NSString *name;
@property NSDate *date;

- (id)initWithCoder:(NSCoder *) coder;

- (void)encodeWithCoder:(NSCoder *) coder;

- (BOOL)isEqual:(id) other;

- (BOOL)isEqualToObject:(CodingObject *) object;

- (NSUInteger)hash;
@end