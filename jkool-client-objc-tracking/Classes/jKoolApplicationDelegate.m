//
//  jKoolApplicationDelegate.m
//  Pods
//
//  Created by Catherine Bernardone on 9/20/16.
//
//

#import "jKoolApplicationDelegate.h"
#import "jkActivity.h"
#import "jkProperty.h"
#import "jkLocation.h"
#import "jKoolStreaming.h"
#import "jKoolCurrentViewController.h"
#import <mach/mach.h>
#import <mach/mach_host.h>
#import <sys/sysctl.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@implementation jKoolApplicationDelegate

jkLocation *jkkLocation;
jKoolStreaming *jkkStreaming;
UIBackgroundTaskIdentifier *backgroundUpdateTask;

+ (void)streamjKoolActivity
{
    [self beginBackgroundUpdateTask];
    jkkStreaming = [[jKoolStreaming alloc] init];
    [jkkStreaming setToken:[[jKoolCurrentViewController sharedManager]  token]];
    [jkkStreaming initializeStream:[[jKoolCurrentViewController sharedManager] vc]];
    jkActivity *activity = [[jKoolCurrentViewController sharedManager] activity];
    [jkkStreaming stream:activity forUrl:@"activity"] ;
    [self endBackgroundUpdateTask];
}



+ (void)createjKoolActivity
{
    // Kick-off locationing
    jkkLocation = [[jkLocation alloc] init];
    [jkkLocation kickOffLocationing];
    jkActivity *activity = [[jkActivity alloc] initWithName:@"Tracking Activity"];
    NSMutableArray * properties = [[NSMutableArray alloc] init];
    [activity setJkstatus:JK_END];
    [activity setReasonCode:9];
    [activity setException:@"my exception"];
    [activity setUser:@"Cathy"];
    [activity setGeoAddr:[jkkLocation getCoordinates]];
    [activity setResource:@"my resource"];
    //jkProperty * propiOSVersion = [[jkProperty alloc] initWithName:@"iOSVersion" andType:@"NSString" andValue:[[UIDevice currentDevice] systemVersion]];
    //jkProperty * propModel = [[jkProperty alloc] initWithName:@"model" andType:@"NSString" andValue:[[UIDevice currentDevice] model]];
    //jkProperty * propVersion = [[jkProperty alloc] initWithName:@"version" andType:@"NSString" andValue:[self platformRawString]];
    CTTelephonyNetworkInfo *phoneInfo = [[CTTelephonyNetworkInfo alloc] init];
    jkProperty * propPhoneCarrier = [[jkProperty alloc] initWithName:@"phonearrier" andType:@"NSString" andValue: [[phoneInfo subscriberCellularProvider] carrierName]];
    //jkProperty * propFreeMemory = [[jkProperty alloc] initWithName:@"freeMemory" andType:@"NSNumber" andValue:[NSString stringWithFormat:@"%ld",(long)get_free_memory]];
    //properties = [[NSMutableArray alloc] init];
    //[properties addObject:propiOSVersion];
    //[properties addObject:propVersion];
    //[properties addObject:propModel];
    //[properties addObject:propPhoneCarrier];
    //[properties addObject:propFreeMemory];
    //[activity setProperties:properties];
    // Store activity so we can stream it later
    [[jKoolCurrentViewController sharedManager] setActivity:activity];
}

+ (NSString *)platformRawString {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}
+ (NSString *)platformNiceString {
    NSString *platform = [self platformRawString];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (4G,2)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (4G,3)";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}



+ (void) endBackgroundUpdateTask
{
    [[UIApplication sharedApplication] endBackgroundTask: backgroundUpdateTask];
    backgroundUpdateTask = UIBackgroundTaskInvalid;
}

+ (void) beginBackgroundUpdateTask
{
    backgroundUpdateTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateTask];
    }];
}

static natural_t get_free_memory(void)
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    vm_statistics_data_t vm_stat;
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS)
    {
        NSLog(@"Failed to fetch vm statistics");
        return 0;
    }
    natural_t mem_free = vm_stat.free_count * pagesize;
    return mem_free;
}



@end
