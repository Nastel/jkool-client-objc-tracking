//
//  NSObject_jKoolCurrentViewController.h
//  Pods
//
//  Created by Catherine Bernardone on 9/19/16.
//
//


#import <foundation/Foundation.h>
#import "jkActivity.h"
#import "jkLocation.h"
#import "jKoolStreaming.h"

@interface jKoolData : NSObject {
    NSString *token;
    UIViewController *vc;
    jkActivity *activity;
    jkLocation *location;
    jKoolStreaming *jkStreaming;
}

@property (nonatomic, retain) NSString *token;
@property (nonatomic, retain) UIViewController *vc;
@property (nonatomic, retain) jkActivity *activity;
@property (nonatomic, retain) jkLocation *location;
@property (nonatomic, retain) jKoolStreaming *jkStreaming;

+ (id)sharedManager;

@end
