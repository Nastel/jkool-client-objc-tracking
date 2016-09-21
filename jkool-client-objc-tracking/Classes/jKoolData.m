#import "jKoolData.h"
#import "jkLocation.h"

@implementation jKoolData

@synthesize vc;
@synthesize token;
@synthesize activity;
@synthesize location;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static jKoolData *jk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jk = [[self alloc] init];
        // Kick-off locationing
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