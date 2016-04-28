//
//  NSDate+convenience.m

//  Dajia
//
//  Created by zhaogw on 15/1/22.
//  Copyright (c) 2015年 zhaogw. All rights reserved.
//

#import "NSDate+convenience.h"

@implementation NSDate (Convenience)

- (NSDate *)fromatDateToNowTimeZone{
//  //设置源日期时区
//  NSTimeZone *sourceTimeZone =
//      [NSTimeZone timeZoneWithAbbreviation:@"UTC"];  //或GMT
//  //设置转换后的目标日期时区
//  NSTimeZone *destinationTimeZone = [NSTimeZone localTimeZone];
//  //得到源日期与世界标准时间的偏移量
//  NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:self];
//  //目标日期与本地时区的偏移量
//  NSInteger destinationGMTOffset =
//      [destinationTimeZone secondsFromGMTForDate:self];
//  //得到时间偏移量的差值
//  NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
//  //转为现在时间
//  NSDate *destinationDateNow =
//      [[NSDate alloc] initWithTimeInterval:interval sinceDate:self];
//  return destinationDateNow;
  
  NSTimeZone *zone=[NSTimeZone systemTimeZone];
  NSInteger interval=[zone secondsFromGMTForDate:[NSDate date]];
  NSDate * newDate=[[NSDate date] dateByAddingTimeInterval:interval];
  //return [NSDate date];
  return newDate;
}
- (NSDate *)formatDateToNowTimeZone:(NSDate *)date{
  NSTimeZone *zone=[NSTimeZone systemTimeZone];
  NSInteger interval=[zone secondsFromGMTForDate:date];
  NSDate * newDate=[date dateByAddingTimeInterval:interval];
  return newDate;
}
- (NSInteger)year {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSDateComponents *components =
      [gregorian components:NSCalendarUnitYear fromDate:self];
  return [components year];
}

- (NSInteger)month {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSDateComponents *components =
      [gregorian components:NSCalendarUnitMonth fromDate:self];
  return [components month];
}

- (NSInteger)day {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSDateComponents *components =
      [gregorian components:NSCalendarUnitDay fromDate:self];
  return [components day];
}

- (NSInteger)firstWeekDayInMonth {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  [gregorian setFirstWeekday:1];  // monday is first day
  //[gregorian setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"nl_NL"]];

  // Set date to first of month
  NSDateComponents *comps = [gregorian
      components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
        fromDate:self];
  [comps setDay:1];
  NSDate *newDate = [gregorian dateFromComponents:comps];

  return [gregorian ordinalityOfUnit:NSCalendarUnitWeekday
                              inUnit:NSCalendarUnitWeekOfMonth
                             forDate:newDate];
}

- (NSDate *)offsetMonth:(NSInteger)numMonths {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  [gregorian setFirstWeekday:1];  // monday is first day

  NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
  [offsetComponents setMonth:numMonths];
  //[offsetComponents setHour:1];
  //[offsetComponents setMinute:30];
  return
      [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)offsetHours:(NSInteger)hours {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  [gregorian setFirstWeekday:1];  // monday is first day

  NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
  //[offsetComponents setMonth:numMonths];
  [offsetComponents setHour:hours];
  //[offsetComponents setMinute:30];
  return
      [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)offsetDay:(NSInteger)numDays {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  [gregorian setFirstWeekday:1];  // monday is first day

  NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
  [offsetComponents setDay:numDays];
  //[offsetComponents setHour:1];
  //[offsetComponents setMinute:30];

  return
      [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSInteger)numDaysInMonth {
  //    NSCalendar *cal = [NSCalendar currentCalendar];
  //    NSRange rng = [cal rangeOfUnit:NSCalendarUnitDay
  //                            inUnit:NSCalendarUnitMonth
  //                           forDate:self];
  //    NSUInteger numberOfDaysInMonth = rng.length;
  //    return numberOfDaysInMonth;

  NSCalendar *calendar = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                 inUnit:NSCalendarUnitMonth
                                forDate:self];
  NSUInteger numberOfDaysInMonth = range.length;
  return numberOfDaysInMonth;
}

+ (NSDate *)dateStartOfDay:(NSDate *)date {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

  NSDateComponents *components = [gregorian
      components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
        fromDate:date];
  return [gregorian dateFromComponents:components];
}

+ (NSDate *)dateStartOfWeek {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  [gregorian setFirstWeekday:1];  // monday is first day

  NSDateComponents *components =
      [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday
                                      fromDate:[NSDate date]];

  NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
  [componentsToSubtract
      setDay:-((([components weekday] - [gregorian firstWeekday]) + 7) % 7)];
  NSDate *beginningOfWeek =
      [gregorian dateByAddingComponents:componentsToSubtract
                                 toDate:[NSDate date]
                                options:0];

  NSDateComponents *componentsStripped = [gregorian
      components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
        fromDate:beginningOfWeek];

  // gestript
  beginningOfWeek = [gregorian dateFromComponents:componentsStripped];

  return beginningOfWeek;
}

+ (NSDate *)dateEndOfWeek {
  NSCalendar *gregorian = [[NSCalendar alloc]
      initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

  NSDateComponents *components =
      [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday
                                      fromDate:[NSDate date]];

  NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
  [componentsToAdd
      setDay:+(((([components weekday] - [gregorian firstWeekday]) + 7) % 7)) +
             6];
  NSDate *endOfWeek = [gregorian dateByAddingComponents:componentsToAdd
                                                 toDate:[NSDate date]
                                                options:0];

  NSDateComponents *componentsStripped = [gregorian
      components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
        fromDate:endOfWeek];

  // gestript
  endOfWeek = [gregorian dateFromComponents:componentsStripped];
  return endOfWeek;
}

+ (NSString *)stringOfDate:(NSDate *)date format:(NSString *)format {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:format];
  NSString *dateStr = [dateFormatter stringFromDate:date];
  return dateStr;
}

+ (NSDate *)dateOfString:(NSString *)string format:(NSString *)format {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:format];
  NSDate *date = [[NSDate alloc] init];
  date = [dateFormatter dateFromString:string];
  return date;
 // return [date formatDateToNowTimeZone:date];
}

@end
