# DRDateHelpers-iOS

Date manipulation helpers for iOS.

## NSDate helpers

#### Add/subtract days, weeks, months to given date
```obj-c
- (NSDate *)DRDateHelpers_dateByAddingDays:(NSInteger)daysCount timeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_dateByAddingWeeks:(NSInteger)weeksCount timeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_dateByAddingMonths:(NSInteger)monthsCount timeZone:(NSTimeZone *)timeZone;
```

#### Beginning/end of day, week, month

- end of (day, week, month) == beginning of next (day, week, month)
- beginning/end of week uses `NSLocale` to support locales with different first day of week

```obj-c
- (NSDate *)DRDateHelpers_beginningOfDayWithTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_endOfDayWithTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_beginningOfWeekWithTimeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;
- (NSDate *)DRDateHelpers_endOfWeekWithTimeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;
- (NSDate *)DRDateHelpers_beginningOfMonthWithTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)DRDateHelpers_endOfMonthWithTimeZone:(NSTimeZone *)timeZone;
```

## Instalation

You can integrate `DRDateHelpers` with your project using Cocoapods. To do so, you will need to add one of the following lines to your Podfile:

For stable release (recommended):

```ruby
pod 'DRDateHelpers', '~> 1.0.1'
```

Which creates dependency for version `>= 1.0.1` and `< 1.1`

For most recent or exact development version (not recommended on production):

```ruby
pod 'DRDateHelpers', :git => 'https://github.com/darrarski/DRDateHelpers-iOS.git', :tag => 'VERSION_TAG'
```

Where `VERSION_TAG` you should put tag name for given version (ex. "v1.0.1"). It is recommended to set version explicity instead of using most recent version, as backward compatibility is not warranted.

You can also download zip archive of given release from [releases page](https://github.com/darrarski/DRDateHelpers-iOS/releases).

## Tests

Unit tests are implemented inside example project.

## License

The MIT License (MIT) - check out included [LICENSE](LICENSE) file.
