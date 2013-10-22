# SimpleUserDefaults

Simple ``NSUserDefaults`` manager

## Installation

```ruby
pod 'SimpleUserDefaults'
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
## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT