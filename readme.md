# SimpleUserDefaults [![Build Status](https://travis-ci.org/azu/SimpleUserDefaults.png)](https://travis-ci.org/azu/SimpleUserDefaults)

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

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT