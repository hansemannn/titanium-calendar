/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiCalendarCalendarView.h"
#import "TiUtils.h"

@implementation TiCalendarCalendarView

- (PDTSimpleCalendarViewController *)calender
{
  if (_calendar == nil) {
    _calendar = [[PDTSimpleCalendarViewController alloc] init];
    _calendar.delegate = self;
    _calendar.view.frame = self.bounds;
    _calendar.view.autoresizingMask = UIViewAutoresizingNone;
    
    [self addSubview:_calendar.view];
  }
  
  return _calendar;
}

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
  [TiUtils setView:_calendar.view positionRect:bounds];
  [super frameSizeChanged:frame bounds:bounds];
}


#pragma mark PDTSimpleCalendarViewDelegate

- (void)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller didSelectDate:(NSDate *)date
{
  [self.proxy fireEvent:@"change" withObject:@{ @"date": date }];
}

- (BOOL)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller isEnabledDate:(NSDate *)date
{
  return YES;
}

@end
