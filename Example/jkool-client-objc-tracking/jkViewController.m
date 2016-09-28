//
//  jkViewController.m
//  jkool-client-objc-tracking
//
//  Created by jKool developer on 09/20/2016.
//  Copyright (c) 2016 jKool developer. All rights reserved.
//

#import "jkViewController.h"
#import "jKoolTracking.h"

@interface jkViewController ()

@end

@implementation jkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonOneClick:(id)sender {
    
}

- (IBAction)buttonTwoClick:(id)sender {
    NSMutableArray *forceUncaught = [NSMutableArray arrayWithCapacity:3];
    [forceUncaught addObject:@"1"];
    [forceUncaught addObject:@"2"];
    [forceUncaught addObject:@"3"];
    [forceUncaught objectAtIndex:5];
    //[jKoolTracking jKoolExceptionHandler:nil];

}

- (IBAction)buttonThreeClick:(id)sender {
    
}



@end
