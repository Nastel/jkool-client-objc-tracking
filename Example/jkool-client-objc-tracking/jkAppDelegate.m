//
//  jkAppDelegate.m
//  jkool-client-objc-tracking
//
//  Created by jKool developer on 09/20/2016.
//  Copyright (c) 2016 jKool developer. All rights reserved.
//

#import "jkAppDelegate.h"
#import "jKoolApplicationDelegate.h"

@implementation jkAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [jKoolApplicationDelegate createjKoolActivity];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

    

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
        [jKoolApplicationDelegate streamjKoolActivity];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
        [jKoolApplicationDelegate createjKoolActivity];
    

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
