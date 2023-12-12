#ifndef OBJC_COSMO_EXTRA
#define OBJC_COSMO_EXTRA

#include "objc.h"
#include <libc/mem/gc.h>
void _gc_free_objc(id);
#define _objgc(THING) _defer((void *)_gc_free_objc, (void *)(THING))
#define _gcalloc(CLASS) _objgc([CLASS alloc])

#endif