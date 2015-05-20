//
// Created by Dariusz Rybicki on 19/05/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DRDateHelpers)

- (NSDate *)DRDateHelpers_dateByAddingDays:(NSInteger)daysCount timeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_dateByAddingWeeks:(NSInteger)weeksCount timeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_dateByAddingMonths:(NSInteger)monthsCount timeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_beginningOfDayWithTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_endOfDayWithTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_beginningOfWeekWithTimeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;
- (NSDate *)DRDateHelpers_endOfWeekWithTimeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;
- (NSDate *)DRDateHelpers_beginningOfMonthWithTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_endOfMonthWithTimeZone:(NSTimeZone *)timeZone;

@end
