/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiProxy.h"
#import "PDTSimpleCalendar.h"

@interface TiCalendarCalendarProxy : TiProxy<PDTSimpleCalendarViewDelegate> {
  PDTSimpleCalendarViewController *_currentCalendar;
  UIColor *_textColor;
  UIColor *_circleColor;
}

- (void)show:(id)args;

@end
