//
//  jkAppDelegate.m
//  jkool-client-objc-tracking
//
//  Created by jKool developer on 09/20/2016.
//  Copyright (c) 2016 jKool developer. All rights reserved.
//

#import "jkAppDelegate.h"
#import "jKoolTracking.h"

@implementation jkAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [jKoolTracking initializeTracking:@"HdC0YR5u58UTNyPByFe7GXuHgLFtFx28"];
    [jKoolTracking setCustomApplicationName:@"Cathys Application" andDataCenter:@"Cathys Data Center" andResource:@"Activity Resource" andSsn:nil andCorrelators:[NSArray arrayWithObjects:@"123",@"456",@"789", nil] andActivityName:@"Cathys Activity Name"];
    [jKoolTracking disableStreamErrors:NO andActions:NO];
    NSSetUncaughtExceptionHandler(&onUncaughtException);

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
        [jKoolTracking streamjKoolActivity];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
        [jKoolTracking createjKoolActivity];
    

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [jKoolTracking createjKoolActivity];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

void onUncaughtException(NSException *exception)
{
    [jKoolTracking jKoolExceptionHandler:exception];
    // Sleeping is necessary to give it time to streaam.
    [NSThread sleepForTimeInterval:5.0f];
}

@end
