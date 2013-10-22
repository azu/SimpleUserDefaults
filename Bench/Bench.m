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
    GVUserDefaults *gvUserDefaults;
}

- (void)setUp {
    [super setUp];
    simpleConfig = [[SimpleConfig alloc] init];
    standardConfig = [[StandardConfig alloc] init];
    gvUserDefaults = [[GVUserDefaults alloc] init];
}

- (void)tearDown {
    simpleConfig = nil;
    standardConfig = nil;
    gvUserDefaults = nil;
    [self resetNSUserDefaults];
    [super tearDown];
}

- (void)resetNSUserDefaults {
    NSDictionary *defaultsDictionary = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    for (NSString *key in [defaultsDictionary allKeys]) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSUInteger)benchmarkRepeatCount {
    return 1000;
}

#pragma mark - Simple
- (void)benchSimpleUserDefaults_init {
    SimpleConfig *config = [[SimpleConfig alloc] init];
}

- (void)benchSimpleUserDefaults_read {
    simpleConfig.name;
}

- (void)benchSimpleUserDefaults_write {
    simpleConfig.name = @"String String";
}

#pragma mark - Standard
- (void)benchStandardUserDefaults_init {
    StandardConfig *config = [[StandardConfig alloc] init];
}

- (void)benchStandardUserDefaults_read {
    standardConfig.name;
}

- (void)benchStandardUserDefaults_write {
    standardConfig.name = @"String String";
}

#pragma mark - GVUserDefaults
- (void)benchGVUserDefaults_init{
    GVUserDefaults *config = [[GVUserDefaults alloc] init];
}
- (void)benchGVUserDefaults_read {
    gvUserDefaults.name;
}

- (void)benchGVUserDefaults_write {
    gvUserDefaults.name = @"String String";
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
