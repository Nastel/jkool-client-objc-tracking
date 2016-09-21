//
//  jkAppDelegate.m
//  jkool-client-objc-tracking
//
//  Created by jKool developer on 09/20/2016.
//  Copyright (c) 2016 jKool developer. All rights reserved.
//

#import "jkAppDelegate.h"
#import "jKoolApplicationDelegate.h"
#import "jKoolCurrentViewController.h"

@implementation jkAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    jKoolCurrentViewController *sharedManager = [jKoolCurrentViewController sharedManager];
    [sharedManager setToken:@"HdC0YR5u58UTNyPByFe7GXuHgLFtFx28"];
    [jKoolApplicationDelegate createjKoolActivity];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
    int i = 0;

    

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
        int i = 0;

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    int i = 0;
}



@end
