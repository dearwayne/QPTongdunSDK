//
//  FMDeviceManager.h
//  FMDeviceManager
//
//  Copyright (c) 2016年 Tongdun.inc. All rights reserved.
//

#define FM_SDK_VERSION @"3.1.0"

#import <Foundation/Foundation.h>

typedef struct _void {
    void (*initWithOptions)(NSDictionary *);
    NSString *(*getDeviceInfo)();
    NSString *(*getInitStatus)();
    NSDictionary *(*getConfigInfo)();
} FMDeviceManager_t;

@interface FMDeviceManager : NSObject

+ (FMDeviceManager_t *) sharedManager;
+ (void) destroy;

@end

