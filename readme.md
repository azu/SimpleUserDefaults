# SimpleUserDefaults
<!-- [![Build Status](https://travis-ci.org/azu/SimpleUserDefaults.png)](https://travis-ci.org/azu/SimpleUserDefaults) -->

Simple ``NSUserDefaults`` manager library - Access NSUserDefaults key using property.

This library use KVO instead of ``objc/runtime.h``.

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

* SimpleUserDefaults(This library) - ``Simple``
* Using NSUserDefaults directly. - ``Standard``
* [gangverk/GVUserDefaults](https://github.com/gangverk/GVUserDefaults "gangverk/GVUserDefaults") - ``GVUserDefaults``

```
:Name                                              :Total(s)  :Avg.(s)
-[Bench test_benchSimpleUserDefaults_init]         0.01163    0.00001    (1/1000)
-[Bench test_benchSimpleUserDefaults_read]         0.00019    0.00000    (1/1000)
-[Bench test_benchSimpleUserDefaults_write]        0.00020    0.00000    (1/1000)

-[Bench test_benchStandardUserDefaults_init]       0.00129    0.00000    (1/1000)
-[Bench test_benchStandardUserDefaults_read]       0.00087    0.00000    (1/1000)
-[Bench test_benchStandardUserDefaults_write]      0.00021    0.00000    (1/1000)

-[Bench test_benchGVUserDefaults_init]             0.02315    0.00002    (1/1000)
-[Bench test_benchGVUserDefaults_read]             0.00021    0.00000    (1/1000)
-[Bench test_benchGVUserDefaults_write]            0.01373    0.00001    (1/1000)

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