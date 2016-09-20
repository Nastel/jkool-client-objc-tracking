//
//  jkViewController.h
//  jkool-client-objc-tracking
//
//  Created by jKool developer on 09/20/2016.
//  Copyright (c) 2016 jKool developer. All rights reserved.
//

@import UIKit;

@interface jkViewController : UIViewController
{
    IBOutlet UIButton *button1;
    IBOutlet UIButton *button2;
    IBOutlet UIButton *button3;
}

- (IBAction)buttonOneClick:(id)sender;
- (IBAction)buttonTwoClick:(id)sender;
- (IBAction)buttonThreeClick:(id)sender;

@end
