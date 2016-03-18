#ifndef PIEZO_H
#define PIEZO_H

#include <stdint.h>

void piezo_init(void);
void piezo_beep(uint32_t msec);

#endif /* PIEZO_H */
