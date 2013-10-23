//
// Created by azu on 2013/10/22.
//


#import <Foundation/Foundation.h>
#import "SimpleUserDefaults.h"

@class CodingObject;

@interface ExampleConfig : SimpleUserDefaults
@property (nonatomic) NSString *name;
@property (nonatomic) CodingObject *codingObject;
@property (nonatomic) BOOL hasBoolValue;
@end