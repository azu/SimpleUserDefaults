//
// Created by azu on 2013/10/22.
//


#import <Foundation/Foundation.h>
#import "SimpleUserDefaults.h"


@interface ExampleConfig : SimpleUserDefaults
@property (nonatomic) NSString *name;
@property (nonatomic) BOOL hasBoolValue;
@end