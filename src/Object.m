/* The implementation of class Object for Objective-C.
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

#include "objc-private/common.h"
#include "objc/Object.h"
#include "objc/runtime.h"
#include "objc/message.h"

@implementation Object

- (Class)class
{
  return object_getClass (self);
}

- (BOOL)isEqual: (id)anObject
{
  return self == anObject;
}

+ (BOOL)isKindOfClass: (Class)aClass
{
  if (aClass == [Object class])
    return YES;
  return NO;
}

- (BOOL)isKindOfClass: (Class)aClass
{
  Class class = object_getClass(self);
  while (class != nil) {
    if (class == aClass) {
      return YES;
    }
    class = class_getSuperclass(class);
  }
  return NO;
}

+ (BOOL) isMemberOfClass: (Class)aClass
{
  return (self == aClass) ? YES : NO;
}

- (BOOL) isMemberOfClass: (Class)aClass
{
  return ([self class] == aClass) ? YES : NO;
}

- (id) performSelector: (SEL)aSelector
{
  IMP msg = objc_msg_lookup(self, aSelector);
  if (msg) {
    return (*msg)(self, aSelector);
  }
  return nil;
}


- (id)performSelector: (SEL)aSelector
      withObject: (id)anObject
{
  IMP msg = objc_msg_lookup(self, aSelector);
  if (msg) {
    return (*msg)(self, aSelector, anObject);
  }
  return nil;
}
- (id)performSelector: (SEL)aSelector
      withObject: (id)object1
      withObject: (id)object2
{
  IMP msg = objc_msg_lookup(self, aSelector);
  if (msg) {
    return (*msg)(self, aSelector, object1, object2);
  }
  return nil;
}

- (BOOL)respondsToSelector: (SEL)aSelector
{
  Class cls = object_getClass(self);
  if (aSelector == 0) {
    return NO;
  }
  if (class_respondsToSelector(cls, aSelector)) {
    return YES;
  }
  if (class_isMetaClass(cls)) {
    return [(Class)self resolveClassMethod: aSelector];
  } else {
    return [cls resolveInstanceMethod: aSelector];
  }
}
+ (BOOL)conformsToProtocol: (Protocol*)aProtocol
{
  Class c;
  for (c = self; c != Nil; c = class_getSuperclass (c)) {
    if (class_conformsToProtocol(c, aProtocol)) {
      return YES;
    }
  }
  return NO;
}
- (BOOL) conformsToProtocol: (Protocol*)aProtocol
{
  return [[self class] conformsToProtocol: aProtocol];
}

+ (id)alloc
{
  return class_createInstance(self, 0);
}

- (void)dealloc
{
  object_dispose(self);
}

+ (BOOL) resolveClassMethod: (SEL)name
{
  return NO;
}

+ (BOOL) resolveInstanceMethod: (SEL)name
{
  return NO;
}

@end
