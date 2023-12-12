/* Interface for the Object class for Objective-C.
   Copyright (C) 1993-2021 Free Software Foundation, Inc.

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 3, or (at your option) any
later version.

GCC is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
License for more details.

Under Section 7 of GPL version 3, you are granted additional
permissions described in the GCC Runtime Library Exception, version
3.1, as published by the Free Software Foundation.

You should have received a copy of the GNU General Public License and
a copy of the GCC Runtime Library Exception along with this program;
see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
<http://www.gnu.org/licenses/>.  */


#ifndef __object_INCLUDE_GNU
#define __object_INCLUDE_GNU

#include "objc.h"

#ifdef __cplusplus
extern "C" {
#endif

@protocol Object
- (Class)class;
- (BOOL)isEqual: (id)anObject;
- (BOOL)isKindOfClass: (Class)aClass;
- (BOOL)isMemberOfClass: (Class)aClass;
- (id)performSelector: (SEL)aSelector;
- (id)performSelector: (SEL)aSelector
      withObject: (id)anObject;
- (id)performSelector: (SEL)aSelector
      withObject: (id)object1
      withObject: (id)object2;
- (BOOL)respondsToSelector: (SEL)aSelector;
- (BOOL)conformsToProtocol: (Protocol*)aProtocol;
+ (id)alloc;
- (void)dealloc;
+ (BOOL)resolveClassMethod: (SEL)name;
+ (BOOL)resolveInstanceMethod: (SEL)name;
@end

__attribute__((objc_root_class))
@interface Object <Object>
{
  Class isa;
}
@end

#ifdef __cplusplus
}
#endif

#endif
