//
//  Created by Dariusz Rybicki on 19/05/15.
//  Copyright (c) 2015 Darrarski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSDate+DRDateHelpers.h"

static NSString *const TimeZone = @"TimeZone";
static NSString *const Locale = @"Locale";
static NSString *const DateFormat = @"DateFormat";
static NSString *const Date = @"Date";
static NSString *const BeginningOfDay = @"BeginningOfDay";
static NSString *const EndOfDay = @"EndOfDay";
static NSString *const BeginningOfWeek = @"BeginningOfWeek";
static NSString *const EndOfWeek = @"EndOfWeek";
static NSString *const BeginningOfMonth = @"BeginningOfMonth";
static NSString *const EndOfMonth = @"EndOfMonth";
static NSString *const NextDay = @"NextDay";
static NSString *const PreviousDay = @"PreviousDay";
static NSString *const NextMonth = @"NextMonth";
static NSString *const PreviousMonth = @"PreviousMonth";

@interface DRDateHelpersTests : XCTestCase

@property (nonatomic, strong) NSArray *data;

@end

@implementation DRDateHelpersTests

#pragma mark - Setup

- (void)setUp
{
    self.data = @[
        @{
            TimeZone:         [NSTimeZone timeZoneForSecondsFromGMT:0],
            Locale:           [[NSLocale alloc] initWithLocaleIdentifier:@"pl_PL"],
            DateFormat:       @"dd.MM.yyyy HH:mm:ss ZZZ",
            Date:             @"19.05.2015 17:00:00 +0000",
            BeginningOfDay:   @"19.05.2015 00:00:00 +0000",
            EndOfDay :        @"19.05.2015 23:59:59 +0000",
            BeginningOfWeek:  @"18.05.2015 00:00:00 +0000",
            EndOfWeek:        @"24.05.2015 23:59:59 +0000",
            BeginningOfMonth: @"01.05.2015 00:00:00 +0000",
            EndOfMonth:       @"31.05.2015 23:59:59 +0000",
            NextDay:          @"20.05.2015 17:00:00 +0000",
            PreviousDay:      @"18.05.2015 17:00:00 +0000",
            NextMonth:        @"19.06.2015 17:00:00 +0000",
            PreviousMonth:    @"19.04.2015 17:00:00 +0000"
        },
        @{
            TimeZone:         [NSTimeZone timeZoneForSecondsFromGMT:0],
            Locale:           [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"],
            DateFormat:       @"dd.MM.yyyy HH:mm:ss ZZZ",
            Date:             @"19.05.2015 17:00:00 +0000",
            BeginningOfWeek:  @"17.05.2015 00:00:00 +0000",
            EndOfWeek:        @"23.05.2015 23:59:59 +0000"
        },
        @{
            TimeZone:         [NSTimeZone timeZoneForSecondsFromGMT:0],
            Locale:           [[NSLocale alloc] initWithLocaleIdentifier:@"pl_PL"],
            DateFormat:       @"dd.MM.yyyy HH:mm:ss ZZZ",
            Date:             @"26.02.2015 18:00:00 +0000",
            BeginningOfWeek:  @"23.02.2015 00:00:00 +0000",
            EndOfWeek:        @"01.03.2015 23:59:59 +0000",
            BeginningOfMonth: @"01.02.2015 00:00:00 +0000",
            EndOfMonth:       @"28.02.2015 23:59:59 +0000"
        },
        @{
            TimeZone:         [NSTimeZone timeZoneForSecondsFromGMT:0],
            Locale:           [[NSLocale alloc] initWithLocaleIdentifier:@"pl_PL"],
            DateFormat:       @"dd.MM.yyyy HH:mm:ss ZZZ",
            Date:             @"31.03.2015 18:00:00 +0000",
            PreviousMonth:    @"28.02.2015 18:00:00 +0000"
        }
    ];
}

- (void)tearDown
{
    self.data = nil;
}

#pragma mark - Tests

- (void)testBeginningOfDay
{
    [self.data enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if (dict[BeginningOfDay] == nil) return;
        NSDateFormatter *dateFormatter = [self dateFormatterForTestDict:dict];
        NSDate *result = [[dateFormatter dateFromString:dict[Date]] DRDateHelpers_beginningOfDayWithTimeZone:dict[TimeZone]];
        NSDate *expectation = [dateFormatter dateFromString:dict[BeginningOfDay]];
        XCTAssertEqualObjects(result, expectation);
    }];
}

- (void)testEndOfDay
{
    [self.data enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if (dict[EndOfDay] == nil) return;
        NSDateFormatter *dateFormatter = [self dateFormatterForTestDict:dict];
        NSDate *result = [[dateFormatter dateFromString:dict[Date]] DRDateHelpers_endOfDayWithTimeZone:dict[TimeZone]];
        NSDate *expectation = [dateFormatter dateFromString:dict[EndOfDay]];
        XCTAssertEqualObjects(result, expectation);
    }];
}

- (void)testBeginningOfWeek
{
    [self.data enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if (dict[BeginningOfWeek] == nil) return;
        NSDateFormatter *dateFormatter = [self dateFormatterForTestDict:dict];
        NSDate *result = [[dateFormatter dateFromString:dict[Date]] DRDateHelpers_beginningOfWeekWithTimeZone:dict[TimeZone] locale:dict[Locale]];
        NSDate *expectation = [dateFormatter dateFromString:dict[BeginningOfWeek]];
        XCTAssertEqualObjects(result, expectation);
    }];
}

- (void)testEndOfWeek
{
    [self.data enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if (dict[EndOfWeek] == nil) return;
        NSDateFormatter *dateFormatter = [self dateFormatterForTestDict:dict];
        NSDate *result = [[dateFormatter dateFromString:dict[Date]] DRDateHelpers_endOfWeekWithTimeZone:dict[TimeZone] locale:dict[Locale]];
        NSDate *expectation = [dateFormatter dateFromString:dict[EndOfWeek]];
        XCTAssertEqualObjects(result, expectation);
    }];
}

- (void)testBeginningOfMonth
{
    [self.data enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if (dict[BeginningOfMonth] == nil) return;
        NSDateFormatter *dateFormatter = [self dateFormatterForTestDict:dict];
        NSDate *result = [[dateFormatter dateFromString:dict[Date]] DRDateHelpers_beginningOfMonthWithTimeZone:dict[TimeZone]];
        NSDate *expectation = [dateFormatter dateFromString:dict[BeginningOfMonth]];
        XCTAssertEqualObjects(result, expectation);
    }];
}

- (void)testEndOfMonth
{
    [self.data enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if (dict[EndOfMonth] == nil) return;
        NSDateFormatter *dateFormatter = [self dateFormatterForTestDict:dict];
        NSDate *result = [[dateFormatter dateFromString:dict[Date]] DRDateHelpers_endOfMonthWithTimeZone:dict[TimeZone]];
        NSDate *expectation = [dateFormatter dateFromString:dict[EndOfMonth]];
        XCTAssertEqualObjects(result, expectation);
    }];
}

- (void)testNextDay
{
    [self.data enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if (dict[NextDay] == nil) return;
        NSDateFormatter *dateFormatter = [self dateFormatterForTestDict:dict];
        NSDate *result = [[dateFormatter dateFromString:dict[Date]] DRDateHelpers_dateByAddingDays:1 timeZone:dict[TimeZone]];
        NSDate *expectation = [dateFormatter dateFromString:dict[NextDay]];
        XCTAssertEqualObjects(result, expectation);
    }];
}

- (void)testPreviousDay
{
    [self.data enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if (dict[PreviousDay] == nil) return;
        NSDateFormatter *dateFormatter = [self dateFormatterForTestDict:dict];
        NSDate *result = [[dateFormatter dateFromString:dict[Date]] DRDateHelpers_dateByAddingDays:-1 timeZone:dict[TimeZone]];
        NSDate *expectation = [dateFormatter dateFromString:dict[PreviousDay]];
        XCTAssertEqualObjects(result, expectation);
    }];
}

- (void)testNextMonth
{
    [self.data enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if (dict[NextMonth] == nil) return;
        NSDateFormatter *dateFormatter = [self dateFormatterForTestDict:dict];
        NSDate *result = [[dateFormatter dateFromString:dict[Date]] DRDateHelpers_dateByAddingMonths:1 timeZone:dict[TimeZone]];
        NSDate *expectation = [dateFormatter dateFromString:dict[NextMonth]];
        XCTAssertEqualObjects(result, expectation);
    }];
}

- (void)testPreviousMonth
{
    [self.data enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        if (dict[PreviousMonth] == nil) return;
        NSDateFormatter *dateFormatter = [self dateFormatterForTestDict:dict];
        NSDate *result = [[dateFormatter dateFromString:dict[Date]] DRDateHelpers_dateByAddingMonths:-1 timeZone:dict[TimeZone]];
        NSDate *expectation = [dateFormatter dateFromString:dict[PreviousMonth]];
        XCTAssertEqualObjects(result, expectation);
    }];
}

#pragma mark - Helpers

- (NSDateFormatter *)dateFormatterForTestDict:(NSDictionary *)dict
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = dict[Locale];
    dateFormatter.timeZone = dict[TimeZone];
    dateFormatter.dateFormat = dict[DateFormat];
    return dateFormatter;
}

@end
