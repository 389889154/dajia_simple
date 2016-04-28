//
//  NSDate+convenience.h
//  Dajia
//
//  Created by zhaogw on 15/1/22.
//  Copyright (c) 2015年 zhaogw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Convenience)

/**
 *  格式化当前日期为当前时区日期
 *
 *  @return 日期
 */
- (NSDate *)fromatDateToNowTimeZone;

/**
 *  @param date传入的NSDate
 *
 *  @return 当前时区的NSDate
 */
- (NSDate *)formatDateToNowTimeZone:(NSDate *)date;
/**
 *  计算当前月份偏移
 *  例如：当前日期是，2014-10-05 ，偏移量是3，则结果为，2015-01-05
 *
 *  @param numMonths 偏移量
 *
 *  @return 偏移后的月份
 */
- (NSDate *)offsetMonth:(NSInteger)numMonths;

/**
 *  计算当前日期偏移
 *  例如：当前日期是，2014-10-05 ，偏移量是3，则结果为，2015-10-08
 *
 *  @param numDays 偏移量
 *
 *  @return 偏移后的日期
 */
- (NSDate *)offsetDay:(NSInteger)numDays;

/**
 *  计算当前时间偏移
 *  例如：当前日期是，2014-10-05 12:00 ，偏移量是3，则结果为，2015-10-08 15:00
 *
 *  @param hours 偏移量
 *
 *  @return 偏移后的时间
 */
- (NSDate *)offsetHours:(NSInteger)hours;

/**
 *  计算当前月有多少天
 *
 *  @return 天数
 */
- (NSInteger)numDaysInMonth;

/**
 *  计算当前月份从周几开始
 *
 *  @return 返回星期
 */
- (NSInteger)firstWeekDayInMonth;

/**
 *  当前年
 *
 *  @return 当前年
 */
- (NSInteger)year;

/**
 *  当前月
 *
 *  @return 当前月
 */
- (NSInteger)month;

/**
 *  当前日
 *
 *  @return 当前日
 */
- (NSInteger)day;

/**
 *  转换日期为当前日
 *
 *  @param date
 *
 *  @return 当前日
 */
+ (NSDate *)dateStartOfDay:(NSDate *)date;

/**
 *  转换日期为开始星期
 *
 *  @param date
 *
 *  @return 开始星期
 */
+ (NSDate *)dateStartOfWeek;

/**
 *  转换日期为结束星期
 *
 *  @param date
 *
 *  @return 结束星期
 */
+ (NSDate *)dateEndOfWeek;

/**
 *  将格式化日期
 *
 *  @param date   日期
 *  @param format 格式化字符串
 *
 *  @return 格式化后的日期字符串
 */
+ (NSString *)stringOfDate:(NSDate *)date format:(NSString *)format;

/**
 *  将日期字符串转化为日期对象
 *
 *  @param string   日期字符串
 *  @param format 格式化字符串
 *
 *  @return 格式化后的日期对象
 */
+ (NSDate *)dateOfString:(NSString *)string format:(NSString *)format;

@end
