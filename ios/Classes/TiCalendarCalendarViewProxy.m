/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiCalendarCalendarViewProxy.h"
#import "PDTSimpleCalendar.h"
#import "TiUtils.h"

@implementation TiCalendarCalendarViewProxy

- (id)_initWithPageContext:(id<TiEvaluator>)context args:(NSArray *)args
{
  if (self = [super _initWithPageContext:context args:args]) {
    PDTSimpleCalendarViewController *calendar = [[self calendarView] calender];
    
    NSDictionary<NSString *, id> *params = args[0];
  
    NSString *title = params[@"title"];
    NSDate *value = params[@"value"];
    NSDate *maxDate = params[@"maxDate"];
    id circleBackgroundColor = params[@"circleBackgroundColor"];
    id circleSelectedBackgroundColor = params[@"circleSelectedBackgroundColor"];
    id textColor = params[@"textColor"];
    id textSelectedColor = params[@"textSelectedColor"];
    id todayTextColor = params[@"todayTextColor"];
    id todayCircleBackgroundColor = params[@"todayCircleBackgroundColor"];

    calendar.firstDate = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitYear
                                                                  value:-3
                                                                 toDate:[NSDate date]
                                                                options:0];

    calendar.lastDate = maxDate ?: [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitYear
                                                                            value:1
                                                                           toDate:[NSDate date]
                                                                          options:0];

    if (value != nil) {
      calendar.selectedDate = value;
    }

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
  }
  
  return self;
}

- (TiCalendarCalendarView *)calendarView
{
  return (TiCalendarCalendarView *)self.view;
}

- (void)scrollToSelectedDate:(id)value
{
  TiThreadPerformOnMainThread(^{
    [[[self calendarView] calender] scrollToSelectedDate:NO];
  }, NO);
}

@end
