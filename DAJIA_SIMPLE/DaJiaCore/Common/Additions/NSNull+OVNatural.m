//
//  NSNull+OVNatural.m
//  DaJiaCore
//
//  Created by lihz on 5/20/15.
//  Copyright (c) 2015 zhengxiaofeng. All rights reserved.
//

#import "NSNull+OVNatural.h"

@implementation NSNull (OVNatural)
- (void)forwardInvocation:(NSInvocation *)invocation {
  if ([self respondsToSelector:[invocation selector]]) {
    [invocation invokeWithTarget:self];
  }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
  NSMethodSignature *sig =
      [[NSNull class] instanceMethodSignatureForSelector:selector];
  if (sig == nil) {
    sig = [NSMethodSignature signatureWithObjCTypes:"@^v^c"];
  }
  return sig;
}

@end