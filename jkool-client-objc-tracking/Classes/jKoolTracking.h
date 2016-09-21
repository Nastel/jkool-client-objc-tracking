//
//  jKoolApplicationDelegate.h
//  Pods
//
//  Created by Catherine Bernardone on 9/20/16.
//
//


@interface jKoolTracking : NSObject

+ (void)streamjKoolActivity;
+ (void)createjKoolActivity;
+ (NSString *)platformNiceString;
+ (NSString *)platformRawString;
+ (void) beginBackgroundUpdateTask;
+ (void) endBackgroundUpdateTask;
+ (void) initializeTracking : (NSString *) token;

@end
