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



@end
