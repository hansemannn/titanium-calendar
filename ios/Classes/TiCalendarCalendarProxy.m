/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiCalendarCalendarProxy.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation TiCalendarCalendarProxy

- (id)_initWithPageContext:(id<TiEvaluator>)context args:(id)args
{
  if (self = [super _initWithPageContext:context args:args]) {
    ENSURE_SINGLE_ARG(args, NSDictionary);
  
    NSString *title = args[@"title"];
    NSDate *value = args[@"value"];
    NSDate *maxDate = args[@"maxDate"];
    UIColor *circleBackgroundColor = args[@"circleBackgroundColor"];
    UIColor *circleSelectedBackgroundColor = args[@"circleSelectedBackgroundColor"];
    UIColor *textColor = args[@"textColor"];
    UIColor *textSelectedColor = args[@"textSelectedColor"];
    UIColor *todayTextColor = args[@"todayTextColor"];
    UIColor *todayCircleBackgroundColor = args[@"todayCircleBackgroundColor"];
    
    _currentCalendar = [[PDTSimpleCalendarViewController alloc] init];
    _currentCalendar.delegate = self;
    
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
      _currentCalendar.navigationItem.title = title;
    }
    
    if (value != nil) {
      _currentCalendar.selectedDate = value;
    }

    _currentCalendar.lastDate = maxDate ?: [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitYear value:3 toDate:[NSDate date] options:0];;

    // Add cancel button
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", @"Cancel")
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(hide:)];
    
    _currentCalendar.navigationItem.rightBarButtonItem = cancelButton;
  }
  
  return self;
}

#pragma Public APIs

- (void)setValue:(id)value
{
  ENSURE_TYPE(value, NSDate);

  if (_currentCalendar != nil) {
    _currentCalendar.selectedDate = value;
  }
}

- (void)show:(id)args
{
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:_currentCalendar];
  
  [TiApp.app showModalController:navigationController animated:true];
  [self fireEvent:@"open"];
}

- (void)hide:(id)unused
{
  [TiApp.app hideModalController:_currentCalendar.navigationController animated:YES];
  
  [self fireEvent:@"close"];
}

#pragma mark PDTSimpleCalendarViewDelegate

- (void)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller didSelectDate:(NSDate *)date
{
  [self fireEvent:@"change" withObject:@{ @"date": date }];
}

- (BOOL)simpleCalendarViewController:(PDTSimpleCalendarViewController *)controller isEnabledDate:(NSDate *)date
{
  return YES;
}


@end
