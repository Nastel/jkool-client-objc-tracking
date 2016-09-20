#import "jKoolCurrentViewController.h"

@implementation jKoolCurrentViewController

@synthesize vc;
@synthesize token;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static jKoolCurrentViewController *jk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jk = [[self alloc] init];
    });
    return jk;
}

- (id)init {
    if (self = [super init]) {
        token = [[NSString alloc] initWithString:@"Default Property Value"];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end