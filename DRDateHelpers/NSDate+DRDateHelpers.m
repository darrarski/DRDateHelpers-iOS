//
// Created by Dariusz Rybicki on 19/05/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import "NSDate+DRDateHelpers.h"

@implementation NSDate (DRDateHelpers)

- (NSDate *)DRDateHelpers_dateByAddingDays:(NSInteger)daysCount timeZone:(NSTimeZone *)timeZone
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    return [calendar dateByAddingUnit:NSCalendarUnitDay value:daysCount toDate:self options:0];
}

- (NSDate *)DRDateHelpers_dateByAddingWeeks:(NSInteger)weeksCount timeZone:(NSTimeZone *)timeZone
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    return [calendar dateByAddingUnit:NSCalendarUnitWeekOfYear value:weeksCount toDate:self options:0];
}

- (NSDate *)DRDateHelpers_dateByAddingMonths:(NSInteger)monthsCount timeZone:(NSTimeZone *)timeZone
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    return [calendar dateByAddingUnit:NSCalendarUnitMonth value:monthsCount toDate:self options:0];
}

- (NSDate *)DRDateHelpers_beginningOfDayWithTimeZone:(NSTimeZone *)timeZone
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                               fromDate:self];
    components.timeZone = timeZone;
    return [calendar dateFromComponents:components];
}

- (NSDate *)DRDateHelpers_endOfDayWithTimeZone:(NSTimeZone *)timeZone
{
    return [[self DRDateHelpers_dateByAddingDays:1 timeZone:timeZone] DRDateHelpers_beginningOfDayWithTimeZone:timeZone];
}

- (NSDate *)DRDateHelpers_beginningOfWeekWithTimeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    calendar.locale = locale;
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfMonth
                                               fromDate:self];
    components.timeZone = timeZone;
    components.weekday = [calendar firstWeekday];
    return [calendar dateFromComponents:components];
}

- (NSDate *)DRDateHelpers_endOfWeekWithTimeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale
{
    return [[self DRDateHelpers_dateByAddingWeeks:1 timeZone:timeZone] DRDateHelpers_beginningOfWeekWithTimeZone:timeZone locale:locale];
}

- (NSDate *)DRDateHelpers_beginningOfMonthWithTimeZone:(NSTimeZone *)timeZone
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth
                                               fromDate:self];
    components.timeZone = timeZone;
    return [calendar dateFromComponents:components];
}

- (NSDate *)DRDateHelpers_endOfMonthWithTimeZone:(NSTimeZone *)timeZone
{
    return [[self DRDateHelpers_dateByAddingMonths:1 timeZone:timeZone] DRDateHelpers_beginningOfMonthWithTimeZone:timeZone];
}

@end
