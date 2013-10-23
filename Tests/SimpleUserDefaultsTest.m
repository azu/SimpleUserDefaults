//
// Created by azu on 2013/10/22.
//


#import <SenTestingKit/SenTestingKit.h>
#import "ExampleConfig.h"
#import "CustomPrefixConfig.h"
#import "CodingObject.h"

@interface SimpleUserDefaultsTest : SenTestCase
@end

@implementation SimpleUserDefaultsTest {
}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
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


- (void)testDefaultsInitialValue {
    ExampleConfig *exampleConfig = [[ExampleConfig alloc] init];
    STAssertNil(exampleConfig.name, @"Defaults should be nil");
    STAssertFalse(exampleConfig.hasBoolValue, @"Defaults should be NO");
}

- (void)testGetSetValue {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userDefaultsKey = [NSStringFromClass(
        [ExampleConfig class]) stringByAppendingString:@".name"];

    ExampleConfig *exampleConfig = [[ExampleConfig alloc] init];
    NSString *inputValue = @"your name";
    exampleConfig.name = inputValue;
    STAssertEqualObjects(exampleConfig.name, inputValue, @"should be return input value");
    STAssertEqualObjects(exampleConfig.name, [defaults objectForKey:userDefaultsKey], @"should be same");

    NSString *newValue = @"new value";
    exampleConfig.name = newValue;
    STAssertEqualObjects(exampleConfig.name, newValue, @"should be write new Value");
    STAssertEqualObjects(exampleConfig.name, [defaults objectForKey:userDefaultsKey], @"should be same");
}

- (void)testNSCodingObject {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userDefaultsKey = [NSStringFromClass(
        [ExampleConfig class]) stringByAppendingString:@".codingObjectData"]; // <= "Data"

    ExampleConfig *exampleConfig = [[ExampleConfig alloc] init];
    CodingObject *newObject = [[CodingObject alloc] init];
    newObject.name = @"SSS";
    newObject.date = [NSDate date];
    exampleConfig.codingObject = newObject;
    STAssertTrue([exampleConfig.codingObject isEqualToObject:newObject], @"should equal to newObject");

    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:newObject];
    STAssertTrue([archivedData isEqualToData:[defaults objectForKey:userDefaultsKey]], @"should be equal");
}

- (void)testPrimitiveValue {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userDefaultsKey = [NSStringFromClass(
        [ExampleConfig class]) stringByAppendingString:@".hasBoolValue"];

    ExampleConfig *exampleConfig = [[ExampleConfig alloc] init];
    exampleConfig.hasBoolValue = YES;
    STAssertTrue(exampleConfig.hasBoolValue, @"should be YES");
    STAssertEqualObjects(@(exampleConfig.hasBoolValue), [defaults objectForKey:userDefaultsKey], @"should be same");

    exampleConfig.hasBoolValue = NO;
    STAssertFalse(exampleConfig.hasBoolValue, @"should be NO");
    STAssertEqualObjects(@(exampleConfig.hasBoolValue), [defaults objectForKey:userDefaultsKey], @"should be same");
}

- (void)testCustomPrefixKey {
    CustomPrefixConfig *config = [[CustomPrefixConfig alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userDefaultsKey = [NSString stringWithFormat:@"%@%@", [config prefixUserDefaultsKey], @"name"];

    NSString *inputValue = @"your name";
    config.name = inputValue;
    STAssertEqualObjects(config.name, inputValue, @"should be return input value");
    STAssertEqualObjects([defaults objectForKey:userDefaultsKey], config.name, @"save key is prefix value");

    STAssertNil([defaults objectForKey:@"CustomPrefixConfig.name"], @"should be nil");
}

@end
