#ifndef MAKETIME_H
#define MAKETIME_H

#include <stdint.h>
#include <time.h>

/* Convert a struct tm into seconds since 1970-01-01T0000.
 * Ignores timezones, DST, and leapseconds */
uint32_t maketime(struct tm *time);

#endif
