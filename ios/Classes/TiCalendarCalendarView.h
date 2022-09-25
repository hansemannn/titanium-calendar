/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiUIView.h"
#import "PDTSimpleCalendar.h"

@interface TiCalendarCalendarView : TiUIView<PDTSimpleCalendarViewDelegate> {
  PDTSimpleCalendarViewController *_calendar;
}

@property (nonatomic, strong) PDTSimpleCalendarViewController *calender;

@end
