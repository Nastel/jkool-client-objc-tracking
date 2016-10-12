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

#import "UIApplication+UIApplication_jk.h"
#import <objc/runtime.h>
#import "jkEvent.h"
#import "jkActivity.h"
#import "jKoolStreaming.h"
#import "jkLocation.h"
#import <UIKit/UIKit.h>
#import "jKoolData.h"
#import "jKoolTracking.h"

@implementation UIApplication (UIApplication_jk)

+ (void)load {
    Class class = [self class];
    SEL originalSelector = @selector(sendAction:to:from:forEvent:);
    SEL replacementSelector = @selector(heap_sendAction:to:from:forEvent:);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method replacementMethod = class_getInstanceMethod(class, replacementSelector);
    method_exchangeImplementations(originalMethod, replacementMethod);
    
    SEL originalEventSelector = @selector(sendEvent:);
    SEL replacementEventSelector = @selector(heap_sendEvent:);
    
    Method originalEventMethod = class_getInstanceMethod(class, originalEventSelector);
    Method replacementEventMethod = class_getInstanceMethod(class, replacementEventSelector);
    method_exchangeImplementations(originalEventMethod, replacementEventMethod);
}

- (BOOL)heap_sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event
    {
        NSString *selectorName = NSStringFromSelector(action);
        NSLog(@"Sending action %@ from sender %@ to target %@ for event %@", NSStringFromSelector(action), sender, target, event);
        jKoolData *sharedManager = [jKoolData sharedManager];
        if (! [selectorName isEqualToString:@"perform:"] && ! [selectorName isEqualToString:@"_sendAction:withEvent:"] && [sharedManager enableActions] && (![sharedManager onlyIfWifi] || ([sharedManager onlyIfWifi] && [jKoolTracking connectionType] == ConnectionTypeWiFi)))
        {
            jKoolData *sharedManager = [jKoolData sharedManager];
            printf("Selector %s occurred.\n", [selectorName UTF8String]);
    
            // Stream Event
            jKoolStreaming *jkStreaming = [sharedManager jkStreaming];
            jkEvent *jKoolEvent = [[jkEvent alloc] initWithName:[NSString stringWithFormat:@"%@", selectorName]];
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
    return [self heap_sendAction:action to:target from:sender forEvent:event];
}

- (BOOL)heap_sendEvent:(UIEvent *)event
{
    jKoolData *sharedManager = [jKoolData sharedManager];
    UIWindow *window = [self keyWindow];
    NSSet *touches = [event touchesForWindow:window];
    for (UITouch *touch in touches) {
        UIView *touchedView = [window hitTest:[touch locationInView:window] withEvent:event];
        NSString *key = [NSString stringWithFormat:@"%i",[touchedView tag]];
        if ([[sharedManager tagToViewName] objectForKey:key] != nil)
        {
            // Stream Event
            jKoolStreaming *jkStreaming = [sharedManager jkStreaming];
            NSString *touchedViewName = [[sharedManager tagToViewName] objectForKey:[NSString stringWithFormat:@"%i",[touchedView tag]]];
            jkEvent *jKoolEvent = [[jkEvent alloc] initWithName:[NSString stringWithFormat:@"touched %@",touchedViewName]];
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

            NSLog(@"Touch received in view %@",[[sharedManager tagToViewName] objectForKey:[NSString stringWithFormat:@"%i",[touchedView tag]]]);
        }
    }
    return [self heap_sendEvent:event];
}
@end
