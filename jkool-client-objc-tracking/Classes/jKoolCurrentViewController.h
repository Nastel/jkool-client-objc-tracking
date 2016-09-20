//
//  NSObject_jKoolCurrentViewController.h
//  Pods
//
//  Created by Catherine Bernardone on 9/19/16.
//
//


#import <foundation/Foundation.h>

@interface jKoolCurrentViewController : NSObject {
    NSString *token;
    UIViewController *vc;
}

@property (nonatomic, retain) NSString *token;
@property (nonatomic, retain) UIViewController *vc;

+ (id)sharedManager;

@end
