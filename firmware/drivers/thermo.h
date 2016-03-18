#ifndef THERMO_H
#define THERMO_H

#include <stdint.h>
#include "ch.h"

msg_t thermo_read(int32_t *result);
void thermo_disp_temp(void);

#endif /* THERMO_H */
