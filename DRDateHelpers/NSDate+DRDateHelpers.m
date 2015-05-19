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
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                               fromDate:self];
    components.timeZone = timeZone;
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    return [calendar dateFromComponents:components];
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
    NSDate *beginningOfWeek = [self DRDateHelpers_beginningOfWeekWithTimeZone:timeZone locale:locale];
    return [beginningOfWeek dateByAddingTimeInterval:60 * 60 * 24 * 7 - 1];
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
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = timeZone;
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth
                                               fromDate:self];
    components.timeZone = timeZone;
    components.day = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    return [calendar dateFromComponents:components];
}

@end
