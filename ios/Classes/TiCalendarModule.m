/**
 * titanium-calendar
 *
 * Created by Your Name
 * Copyright (c) 2018 Your Company. All rights reserved.
 */

#import "TiCalendarModule.h"
#import "TiBase.h"
#import "TiHost.h"

@implementation TiCalendarModule

#pragma mark Internal

// This is generated for your module, please do not change it
- (id)moduleGUID
{
  return @"2eeb279e-c99e-4d61-ac20-5aeb15767750";
}

// This is generated for your module, please do not change it
- (NSString *)moduleId
{
  return @"ti.calendar";
}

#pragma mark Lifecycle

- (void)startup
{
  // This method is called when the module is first loaded
  // You *must* call the superclass
  [super startup];
  DebugLog(@"[DEBUG] %@ loaded", self);
}

@end
