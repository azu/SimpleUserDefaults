//
//  Bench.m
//  Bench
//
//  Created by azu on 2013/10/22.
//  Copyright (c) 2013年 azu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleConfig.h"
#import "StandardConfig.h"
#import "AZBenchmarkTestCase.h"
#import "GVUserDefaults.h"
#import "GVUserDefaults+Config.h"

@interface Bench : AZBenchmarkTestCase

@end

@implementation Bench {
    SimpleConfig *simpleConfig;
    StandardConfig *standardConfig;
}

- (void)setUp {
    [super setUp];
    simpleConfig = [[SimpleConfig alloc] init];
    standardConfig = [[StandardConfig alloc] init];
}

- (void)tearDown {
    [super tearDown];
    [self resetNSUserDefaults];
}

- (void)resetNSUserDefaults {
    NSDictionary *defaultsDictionary = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDictionary allKeys]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSUInteger)benchmarkRepeatCount {
    return 10000;
}

#pragma mark - Simple
- (void)benchSimpleUserDefaults_All {
    SimpleConfig *config = simpleConfig;
    config.name = @"String String";
    NSString *getName = config.name;
}

- (void)benchSimpleUserDefaults_read {
    simpleConfig.name;
}

- (void)benchSimpleUserDefaults_write {
    simpleConfig.name = @"String String";
}

#pragma mark - Standard
- (void)benchStandardUserDefaults_All {
    StandardConfig *config = standardConfig;
    config.name = @"String String";
    NSString *getName = config.name;
}

- (void)benchStandardUserDefaults_read {
    standardConfig.name;
}

- (void)benchStandardUserDefaults_write {
    standardConfig.name = @"String String";
}
#pragma mark - GVUserDefaults
- (void)benchGVUserDefaults_All {
    GVUserDefaults *config = [GVUserDefaults standardUserDefaults];
    config.name = @"String String";
    NSString *getName = config.name;
}
@end
