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
    NSString *applicationName;
    NSString *activityName;
    NSString *dataCenter;
    NSString *resource;
    NSString *ssn;
    NSArray *correlators;
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
@property (nonatomic, retain) NSString *applicationName;
@property (nonatomic, retain) NSString *activityName;
@property (nonatomic, retain) NSString *dataCenter;
@property (nonatomic, retain) NSString *resource;
@property (nonatomic, retain) NSString *ssn;
@property (nonatomic, retain) NSArray *correlators;






+ (id)sharedManager;

@end
