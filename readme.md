# SimpleUserDefaults
<!-- [![Build Status](https://travis-ci.org/azu/SimpleUserDefaults.png)](https://travis-ci.org/azu/SimpleUserDefaults) -->

Simple ``NSUserDefaults`` manager library.

## Installation

```ruby
pod 'SimpleUserDefaults', :git => 'https://github.com/azu/SimpleUserDefaults.git'
```

## Usage

```objc
#import "SimpleUserDefaults.h"
// implement subclass of SimpleUserDefaults
@interface ExampleConfig : SimpleUserDefaults
@property (nonatomic) NSString *name;// <- getter/setter access NSUserDefaults
@property (nonatomic) BOOL hasBoolValue;
@end

@implementation ExampleConfig
- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    // initialize NSUserDefaults target
    [self addObserverSelector:@selector(name)];
    [self addObserverSelector:@selector(hasBoolValue)];
    return self;
}
@end
```

```objc
ExampleConfig *exampleConfig = [[ExampleConfig alloc] init];
exampleConfig.name = @"your name";
// Automatically save name value as NSUserDefaults.
```

For more detail on [Example](Example).

## Benchmark

* SimpleUserDefaults(This library)
* Using NSUserDefaults directly.
* [gangverk/GVUserDefaults](https://github.com/gangverk/GVUserDefaults "gangverk/GVUserDefaults")


```
:Name                                              :Total(s)  :Avg.(s)
-[Bench test_benchSimpleUserDefaults_All]          0.00126    0.00000    (1/10000)
-[Bench test_benchSimpleUserDefaults_read]         0.00066    0.00000    (1/10000)
-[Bench test_benchSimpleUserDefaults_write]        0.00042    0.00000    (1/10000)

-[Bench test_benchStandardUserDefaults_All]        0.00067    0.00000    (1/10000)
-[Bench test_benchStandardUserDefaults_read]       0.00076    0.00000    (1/10000)
-[Bench test_benchStandardUserDefaults_write]      0.00050    0.00000    (1/10000)

-[Bench test_benchGVUserDefaults_All]              0.13562    0.00001    (1/10000)
```

For more detail on [Bench](Bench).

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT