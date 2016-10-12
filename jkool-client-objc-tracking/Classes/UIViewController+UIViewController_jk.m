/*
 * Copyright (c) 2016 jKool, LLC. All Rights Reserved.
 *
 * This software is the confidential and proprietary information of
 * jKool, LLC. ("Confidential Information").  You shall not disclose
 * such Confidential Information and shall use it only in accordance with
 * the terms of the license agreement you entered into with jKool, LLC.
 *
 * JKOOL MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF
 * THE SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE, OR NON-INFRINGEMENT. JKOOL SHALL NOT BE LIABLE FOR ANY DAMAGES
 * SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR DISTRIBUTING
 * THIS SOFTWARE OR ITS DERIVATIVES.
 *
 * CopyrightVersion 1.0
 *
 */

#import "UIViewController+UIViewController_jk.h"
#import <objc/runtime.h>
#import "jKoolData.h"
#import "jKoolTracking.h"
#import "jkEvent.h"

@implementation UIViewController (jk)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(jk_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        if (didAddMethod)
        {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else 
        {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
        
        SEL originalDisappearSelector = @selector(viewWillDisappear:);
        SEL swizzledDisappearSelector = @selector(jk_viewWillDisappear:);
        
        Method originalDisappearMethod = class_getInstanceMethod(class, originalDisappearSelector);
        Method swizzledDisappearMethod = class_getInstanceMethod(class, swizzledDisappearSelector);
        
        BOOL didAddDisappearMethod =
        class_addMethod(class,
                        originalDisappearSelector,
                        method_getImplementation(swizzledDisappearMethod),
                        method_getTypeEncoding(swizzledDisappearMethod));
        if (didAddMethod)
        {
            class_replaceMethod(class,
                                swizzledDisappearSelector,
                                method_getImplementation(originalDisappearMethod),
                                method_getTypeEncoding(originalDisappearMethod));
        } else
        {
            method_exchangeImplementations(originalDisappearMethod, swizzledDisappearMethod);
        }

        
        
        
        
        
        
    });
}

- (void)jk_viewWillAppear:(BOOL)animated {
    [self jk_viewWillAppear:animated];
    jKoolData *sharedManager = [jKoolData sharedManager];
    if ([sharedManager onlyIfWifi] == NO || ([sharedManager onlyIfWifi] == NO ||([sharedManager onlyIfWifi] == YES && [jKoolTracking connectionType] == ConnectionTypeWiFi)))
    [sharedManager setVc:NSStringFromClass([self class])];
    
    // Stream Event
    jKoolStreaming *jkStreaming = [sharedManager jkStreaming];
    jkEvent *jKoolEvent = [[jkEvent alloc] initWithName:[NSString stringWithFormat:@"%@", @"viewAppearing"]];
    [jKoolEvent setResource:[NSString stringWithFormat:@"%@", [sharedManager vc]]];
    [jKoolEvent setGeoAddr:[[sharedManager location] getCoordinates]];
    [jKoolEvent setParentTrackId:[[sharedManager activity] trackingId]];
    [jKoolEvent setAppl:[sharedManager applicationName]];
    [jKoolEvent setServer:[[UIDevice currentDevice] name]];
    [jKoolEvent setDataCenter:[sharedManager dataCenter]];
    [jKoolEvent setSourceSsn:[sharedManager ssn]];
    [jKoolEvent setNetAddr:[sharedManager ipAddress]];
    [jKoolEvent setType:JK_TYPE_CALL];
    [jKoolEvent setJkSeverity:JK_SEV_TRACE];
    NSUUID *uuid = [NSUUID UUID];
    [jKoolEvent setUser:[uuid UUIDString]];
    [jkStreaming stream:jKoolEvent forUrl:@"event"];
    
    
    
    
    
}

- (void)jk_viewWillDisappear:(BOOL)animated {
    [self jk_viewWillDisappear:animated];
    jKoolData *sharedManager = [jKoolData sharedManager];
    if ([sharedManager onlyIfWifi] == NO || ([sharedManager onlyIfWifi] == NO ||([sharedManager onlyIfWifi] == YES && [jKoolTracking connectionType] == ConnectionTypeWiFi)))
       // [sharedManager setVc:NSStringFromClass([self class])];
        NSLog(NSStringFromClass([self class]));
    
    
    // Stream Event
    jKoolStreaming *jkStreaming = [sharedManager jkStreaming];
    jkEvent *jKoolEvent = [[jkEvent alloc] initWithName:[NSString stringWithFormat:@"%@", @"viewDisappearing"]];
    [jKoolEvent setResource:NSStringFromClass([self class])];
    [jKoolEvent setGeoAddr:[[sharedManager location] getCoordinates]];
    [jKoolEvent setParentTrackId:[[sharedManager activity] trackingId]];
    [jKoolEvent setAppl:[sharedManager applicationName]];
    [jKoolEvent setServer:[[UIDevice currentDevice] name]];
    [jKoolEvent setDataCenter:[sharedManager dataCenter]];
    [jKoolEvent setSourceSsn:[sharedManager ssn]];
    [jKoolEvent setNetAddr:[sharedManager ipAddress]];
    [jKoolEvent setType:JK_TYPE_CALL];
    [jKoolEvent setJkSeverity:JK_SEV_TRACE];
    NSUUID *uuid = [NSUUID UUID];
    [jKoolEvent setUser:[uuid UUIDString]];
    [jkStreaming stream:jKoolEvent forUrl:@"event"];
    
}
@end
