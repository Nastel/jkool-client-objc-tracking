//
//  jkViewController.m
//  jkool-client-objc-tracking
//
//  Created by jKool developer on 09/20/2016.
//  Copyright (c) 2016 jKool developer. All rights reserved.
//

#import "jkViewController.h"

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
    
}

- (IBAction)buttonThreeClick:(id)sender {
    
}

// If using this ViewController as the handler.
- (void) handlejKoolResponse:(NSData *) data  {
    NSString * str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Streaming Callback: %@",str);

}

@end
