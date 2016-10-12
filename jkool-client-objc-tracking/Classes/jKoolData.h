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


#import <foundation/Foundation.h>
@import jkool_client_objc_api;

typedef enum {
    ConnectionTypeUnknown,
    ConnectionTypeNone,
    ConnectionType3G,
    ConnectionTypeWiFi
} ConnectionType;




@interface jKoolData : NSObject {
    NSString *token;
    NSString *applicationName;
    NSString *activityName;
    NSString *dataCenter;
    NSString *resource;
    NSString *ssn;
    NSArray *correlators;
    NSString *vc;
    jkActivity *activity;
    jkLocation *location;
    jKoolStreaming *jkStreaming;
    ConnectionType connectionType;
    NSString *ipAddress;
    bool disableActions;
    bool disableErrors;
    bool onlyIfWifi;
    NSDictionary *tagToViewName;
}




@property (nonatomic, retain) NSString *token;
@property (nonatomic, retain) NSString *vc;
@property (nonatomic, retain) jkActivity *activity;
@property (nonatomic, retain) jkLocation *location;
@property (nonatomic, retain) jKoolStreaming *jkStreaming;
@property (nonatomic, retain) NSString *applicationName;
@property (nonatomic, retain) NSString *activityName;
@property (nonatomic, retain) NSString *dataCenter;
@property (nonatomic, retain) NSString *resource;
@property (nonatomic, retain) NSString *ssn;
@property (nonatomic, retain) NSArray *correlators;
@property (nonatomic) ConnectionType connectionType;
@property (nonatomic, retain) NSString *ipAddress;
@property (nonatomic) bool enableErrors;
@property (nonatomic) bool enableActions;
@property (nonatomic) bool onlyIfWifi;
@property (nonatomic, retain) NSDictionary *tagToViewName;



+ (id)sharedManager;

@end
