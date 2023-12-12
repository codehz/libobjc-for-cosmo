#include "objc/cosmo-extra.h"
#include "objc/message.h"
#include "objc/runtime.h"

void _gc_free_objc(id target) { 
  if (!target) return;
  IMP dealloc = objc_msg_lookup(target, @selector(dealloc));
  if (dealloc) {
    dealloc(target, @selector(dealloc));
  } else {
    object_dispose(target);
  }
}