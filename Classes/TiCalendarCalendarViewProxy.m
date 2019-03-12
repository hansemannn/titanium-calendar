/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiCalendarCalendarViewProxy.h"
#import <PDTSimpleCalendar/PDTSimpleCalendar.h>
#import "TiUtils.h"

@implementation TiCalendarCalendarViewProxy

- (id)_initWithPageContext:(id<TiEvaluator>)context args:(NSArray *)args
{
  if (self = [super _initWithPageContext:context args:args]) {
    PDTSimpleCalendarViewController *calendar = [[self calendarView] calender];
    
    NSDictionary<NSString *, id> *params = args[0];
  
    NSString *title = params[@"title"];
    NSDate *value = params[@"value"];
    UIColor *circleBackgroundColor = params[@"circleBackgroundColor"];
    UIColor *circleSelectedBackgroundColor = params[@"circleSelectedBackgroundColor"];
    UIColor *textColor = params[@"textColor"];
    UIColor *textSelectedColor = params[@"textSelectedColor"];
    UIColor *todayTextColor = params[@"todayTextColor"];
    UIColor *todayCircleBackgroundColor = params[@"todayCircleBackgroundColor"];
    
    if (circleBackgroundColor != nil) {
      [[PDTSimpleCalendarViewCell appearance] setCircleDefaultColor:[TiUtils colorValue:circleBackgroundColor].color];
    }
    
    if (circleSelectedBackgroundColor != nil) {
      [[PDTSimpleCalendarViewCell appearance] setCircleSelectedColor:[TiUtils colorValue:circleSelectedBackgroundColor].color];
    }
    
    if (textColor != nil) {
      [[PDTSimpleCalendarViewCell appearance] setTextDefaultColor:[TiUtils colorValue:textColor].color];
    }
    
    if (textSelectedColor != nil) {
      [[PDTSimpleCalendarViewCell appearance] setTextSelectedColor:[TiUtils colorValue:textSelectedColor].color];
    }
    
    if (todayCircleBackgroundColor != nil) {
      [[PDTSimpleCalendarViewCell appearance] setCircleTodayColor:[TiUtils colorValue:todayCircleBackgroundColor].color];
    }
    
    if (todayTextColor != nil) {
      [[PDTSimpleCalendarViewCell appearance] setTextTodayColor:[TiUtils colorValue:todayTextColor].color];
    }
    
    if (title != nil) {
      calendar.navigationItem.title = title;
    }
    
    if (value != nil) {
      calendar.selectedDate = value;
    }
  }
  
  return self;
}

- (TiCalendarCalendarView *)calendarView
{
  return (TiCalendarCalendarView *)self.view;
}

@end
