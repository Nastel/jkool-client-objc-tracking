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

#import "jKoolData.h"

@implementation jKoolData

@synthesize vc;
@synthesize token;
@synthesize activity;
@synthesize activityName;
@synthesize location;
@synthesize jkStreaming;
@synthesize applicationName;
@synthesize dataCenter;
@synthesize resource;
@synthesize ssn;
@synthesize correlators;
@synthesize connectionType;
@synthesize ipAddress;
@synthesize enableActions;
@synthesize enableErrors;
@synthesize onlyIfWifi;
@synthesize tagToViewName;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static jKoolData *jk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jk = [[self alloc] init];
    });
    return jk;
}

- (id)init {
    if (self = [super init]) {
        token = @"Default Property Value";
    }
    return self;
}

- (void)dealloc {
}

@end
