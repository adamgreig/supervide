#include <stdint.h>
#include <stdbool.h>
#include <time.h>
#include "maketime.h"

/* Is it a leap year!? */
bool is_leap_year(uint16_t year)
{
    /* STM32F0 represents years as a 2-digit number
     * It has no concept of what century these 2 digits are based in, if any
     * Therefore it cannot meaningfully handle century-leap-years
     * As this library is meant to match the STM32F0 calendar,
     * we leave out century leap years here.
     * We will, therefore, not match time.h's mktime  for dates after
     * 2100-02-28 */

    if(year % 4 == 0)
        return true;
    else
        return false;
}

/* How many days are there in a given year */
uint16_t days_in_year(uint16_t year)
{
    return is_leap_year(year) ? 366 : 365;
}

/* How many days are there in a month */
uint8_t days_in_month(uint8_t month, uint16_t year)
{
    switch(month)
    {
        case 0: return 31;
        case 1: return is_leap_year(year) ? 29 : 28;
        case 2: return 31;
        case 3: return 30;
        case 4: return 31;
        case 5: return 30;
        case 6: return 31;
        case 7: return 31;
        case 8: return 30;
        case 9: return 31;
        case 10: return 30;
        case 11: return 31;
        default: return 0; /* TODO: panic? */
    }
}

/* Convert a struct tm into seconds since 1970-01-01T00:00
 * Ignores timezones, daylight savings, and leap seconds. */
uint32_t maketime(struct tm *time)
{
    uint32_t t = 0;
    uint16_t i;

    /* Seconds, minutes, hours: easy */
    t += time->tm_sec;
    t += time->tm_min * 60;
    t += time->tm_hour * 60 * 60;

    /* Tot up time in months before this one */
    /* Remember struct tm years are since 1900 */
    for(i=0; i<time->tm_mon; i++)
        t += days_in_month(i, 1900+time->tm_year) * 24 * 60 * 60;

    /* Tot up all the time in years before this one */
    /* Remember struct tm years are since 1900 */
    for(i=1970; i<time->tm_year; i++)
        t += days_in_year(1900+i) * 24 * 60 * 60;

    return t;
}

