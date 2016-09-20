//
//  NSObject_jKoolCurrentViewController.h
//  Pods
//
//  Created by Catherine Bernardone on 9/19/16.
//
//


#import <foundation/Foundation.h>
#import "jkActivity.h"

@interface jKoolCurrentViewController : NSObject {
    NSString *token;
    UIViewController *vc;
    jkActivity *activity;
}

@property (nonatomic, retain) NSString *token;
@property (nonatomic, retain) UIViewController *vc;
@property (nonatomic, retain) jkActivity *activity;

+ (id)sharedManager;

@end
