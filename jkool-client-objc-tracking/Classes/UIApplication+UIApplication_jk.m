/*
 * Copyright (c) 2010 jKool, LLC. All Rights Reserved.
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

#import "UIApplication+UIApplication_jk.h"
#import <objc/runtime.h>
#import "jkEvent.h"
#import "jkActivity.h"
#import "jKoolStreaming.h"
#import "jkLocation.h"
#import <UIKit/UIKit.h>
#import "jKoolCurrentViewController.h"

@implementation UIApplication (UIApplication_jk)
jkEvent *jKoolEvent;
jKoolStreaming *jkStreaming;
jkLocation *location;

+ (void)load {
    Class class = [self class];
    SEL originalSelector = @selector(sendAction:to:from:forEvent:);
    SEL replacementSelector = @selector(heap_sendAction:to:from:forEvent:);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method replacementMethod = class_getInstanceMethod(class, replacementSelector);
    method_exchangeImplementations(originalMethod, replacementMethod);
    
    // Kick-off locationing
    location = [[jkLocation alloc] init];
    [location kickOffLocationing];
}

- (BOOL)heap_sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event {
    NSString *selectorName = NSStringFromSelector(action);
    jKoolCurrentViewController *sharedManager = [jKoolCurrentViewController sharedManager];
    printf("Selector %s occurred.\n", [selectorName UTF8String]);
    
    // Stream Event
    jkStreaming = [[jKoolStreaming alloc] init];
    [jkStreaming setToken:[sharedManager token]];
    [jkStreaming initializeStream:[sharedManager vc]];
    jKoolEvent = [[jkEvent alloc] initWithName:selectorName];
    [jKoolEvent setMsgText:@"hello world"] ;
    [jKoolEvent setUser:@"Cathy"];
    [jKoolEvent setGeoAddr:[location getCoordinates]];
    [jKoolEvent setResource:@"my resource"];
    [jKoolEvent setParentTrackId:[[sharedManager activity] trackingId]];
    [jkStreaming stream:jKoolEvent forUrl:@"event"];
    
    return [self heap_sendAction:action to:target from:sender forEvent:event];
}
@end