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

@interface jKoolTracking : NSObject


+ (void)streamjKoolActivity;
+ (void)createjKoolActivity;
+ (NSString *)platformNiceString;
+ (NSString *)platformRawString;
+ (void) beginBackgroundUpdateTask;
+ (void) endBackgroundUpdateTask;
+ (void) initializeTracking : (NSString *) token enableErrors : (bool) enableErrors enableActions : (bool) enableActions onlyIfWifi : (bool) onlyIfWifi;
+ (void) setApplicationName : (NSString *) applName andDataCenter : (NSString *) dataCenter andResource : (NSString *) resource andSsn : (NSString *) ssn andCorrelators: (NSArray *) correlators  andActivityName : (NSString *) activityName;
+ (ConnectionType)connectionType;
+ (bool) jKoolExceptionHandler: (NSException *) exception;
@end
