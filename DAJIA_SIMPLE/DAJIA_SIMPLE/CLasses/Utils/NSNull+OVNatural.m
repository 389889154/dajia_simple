//
//  NSNull+OVNatural.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
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
