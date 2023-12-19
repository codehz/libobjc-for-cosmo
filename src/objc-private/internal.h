#pragma once

#define INTERNAL_API                                                           \
  __attribute__((__no_instrument_function__,                                   \
                 __patchable_function_entry__(0, 0),                           \
                 __no_sanitize_undefined__, __no_sanitize_address__,           \
                 optimize("omit-frame-pointer")))
