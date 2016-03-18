#include "dma_mutexes.h"

mutex_t dma_mutexes_ch3;

void dma_mutexes_init()
{
    chMtxObjectInit(&dma_mutexes_ch3);
}
