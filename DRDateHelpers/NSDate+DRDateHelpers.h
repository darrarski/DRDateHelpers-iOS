//
// Created by Dariusz Rybicki on 19/05/15.
// Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DRDateHelpers)

/**
 Creates new NSDate object by adding given number of days
 
 @param daysCount number of days
 @param timeZone  time zone
 
 @return new date
 */
- (NSDate *)DRDateHelpers_dateByAddingDays:(NSInteger)daysCount timeZone:(NSTimeZone *)timeZone;

/**
 Creates new NSDate object by adding given number of weeks
 
 @param weeksCount number of weeks
 @param timeZone   time zone
 
 @return new date
 */
- (NSDate *)DRDateHelpers_dateByAddingWeeks:(NSInteger)weeksCount timeZone:(NSTimeZone *)timeZone;

/**
 Creates new NSDate object by adding given number of months
 
 @param monthsCount number of months
 @param timeZone    time zone
 
 @return new date
 */
- (NSDate *)DRDateHelpers_dateByAddingMonths:(NSInteger)monthsCount timeZone:(NSTimeZone *)timeZone;

/**
 Creates new NSDate object that represents beginning of a day
 
 @param timeZone time zone
 
 @return new date
 */
- (NSDate *)DRDateHelpers_beginningOfDayWithTimeZone:(NSTimeZone *)timeZone;

/**
 Creates new NSDate object that represent end of a day
 
 @param timeZone time zone
 
 @return new date
 */
- (NSDate *)DRDateHelpers_endOfDayWithTimeZone:(NSTimeZone *)timeZone;

/**
 Creates new NSDate object that represents beginning of a week
 
 @param timeZone time zone
 @param locale   locale
 
 @return new date
 */
- (NSDate *)DRDateHelpers_beginningOfWeekWithTimeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

/**
 Creates new NSDate object that represents end of a week
 
 @param timeZone time zone
 @param locale   locale
 
 @return new date
 */
- (NSDate *)DRDateHelpers_endOfWeekWithTimeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

/**
 Creates new NSDate object that represents beginning of a month
 
 @param timeZone time zone
 
 @return new date
 */
- (NSDate *)DRDateHelpers_beginningOfMonthWithTimeZone:(NSTimeZone *)timeZone;

/**
 Creates new NSDate object that represents end of a month
 
 @param timeZone time zone
 
 @return new date
 */
- (NSDate *)DRDateHelpers_endOfMonthWithTimeZone:(NSTimeZone *)timeZone;

@end
