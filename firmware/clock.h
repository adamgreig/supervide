#ifndef CLOCK_H
#define CLOCK_H

#include <stdint.h>

void rtc_disp_time(void);
void rtc_set_time(void);
void rtc_set_bkup(void);
void rtc_disp_bkup(void);

#endif
