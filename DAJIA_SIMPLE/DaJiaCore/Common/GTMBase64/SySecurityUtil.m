//
//  SySecurityUtil.m
//  Dajia
//
//  Created by zhengxiaofeng on 13-8-19.
//  Copyright (c) 2013年 zhengxiaofeng. All rights reserved.
//

#import "SySecurityUtil.h"
#import "SyBase64.h"
#import <Security/Security.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

#define kChosenCipherBlockSize 16
#define kChosenCipherKeySize 16

@implementation SySecurityUtil

#pragma mark - base64
+ (NSString *)encodeBase64String:(NSString *)input {
  NSData *data =
      [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
  data = [SyBase64 encodeData:data];
  NSString *base64String =
      [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  return base64String;
}

+ (NSString *)decodeBase64String:(NSString *)input {
  NSData *data =
      [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
  data = [SyBase64 decodeData:data];
  NSString *base64String =
      [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  return base64String;
}

+ (NSString *)encodeBase64Data:(NSData *)data {
  data = [SyBase64 encodeData:data];
  NSString *base64String =
      [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  return base64String;
}

+ (NSString *)decodeBase64Data:(NSData *)data {
  data = [SyBase64 decodeData:data];
  NSString *base64String =
      [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  return base64String;
}

+ (NSData *)doCipher:(NSData *)plainText
                 key:(NSData *)aSymmetricKey
             context:(CCOperation)encryptOrDecrypt
             padding:(CCOptions *)pkcs7 {
  CCCryptorStatus ccStatus = kCCSuccess;
  // Symmetric crypto reference.
  CCCryptorRef thisEncipher = NULL;
  // Cipher Text container.
  NSData *cipherOrPlainText = nil;
  // Pointer to output buffer.
  uint8_t *bufferPtr = NULL;
  // Total size of the buffer.
  size_t bufferPtrSize = 0;
  // Remaining bytes to be performed on.
  size_t remainingBytes = 0;
  // Number of bytes moved to buffer.
  size_t movedBytes = 0;
  // Length of plainText buffer.
  size_t plainTextBufferSize = 0;
  // Placeholder for total written.
  size_t totalBytesWritten = 0;
  // A friendly helper pointer.
  uint8_t *ptr;

  // Initialization vector; dummy in this case 0's.
  uint8_t iv[kChosenCipherBlockSize];
  memset((void *)iv, 0x0, (size_t)sizeof(iv));

  plainTextBufferSize = [plainText length];

  // Create and Initialize the crypto reference.
  ccStatus =
      CCCryptorCreate(encryptOrDecrypt, kCCAlgorithmAES128, *pkcs7,
                      (const void *)[aSymmetricKey bytes], kChosenCipherKeySize,
                      (const void *)iv, &thisEncipher);

  // Calculate byte block alignment for all calls through to and including
  // final.
  bufferPtrSize =
      CCCryptorGetOutputLength(thisEncipher, plainTextBufferSize, true);

  // Allocate buffer.
  bufferPtr = malloc(bufferPtrSize * sizeof(uint8_t));

  // Zero out buffer.
  memset((void *)bufferPtr, 0x0, bufferPtrSize);

  // Initialize some necessary book keeping.

  ptr = bufferPtr;

  // Set up initial size.
  remainingBytes = bufferPtrSize;

  // Actually perform the encryption or decryption.
  ccStatus =
      CCCryptorUpdate(thisEncipher, (const void *)[plainText bytes],
                      plainTextBufferSize, ptr, remainingBytes, &movedBytes);

  // Handle book keeping.
  ptr += movedBytes;
  remainingBytes -= movedBytes;
  totalBytesWritten += movedBytes;

  // Finalize everything to the output buffer.
  ccStatus = CCCryptorFinal(thisEncipher, ptr, remainingBytes, &movedBytes);

  totalBytesWritten += movedBytes;

  if (thisEncipher) {
    (void)CCCryptorRelease(thisEncipher);
    thisEncipher = NULL;
  }

  if (ccStatus == kCCSuccess)
    cipherOrPlainText = [NSData dataWithBytes:(const void *)bufferPtr
                                       length:(NSUInteger)totalBytesWritten];
  else
    cipherOrPlainText = nil;

  if (bufferPtr) free(bufferPtr);

  return cipherOrPlainText;
}

+ (NSData *)AES256Encrypt:(NSData *)srcData key:(NSString *)key {
  CCOptions cco = kCCOptionPKCS7Padding;
  return [SySecurityUtil doCipher:srcData
                              key:[key dataUsingEncoding:NSUTF8StringEncoding]
                          context:kCCEncrypt
                          padding:&cco];
}

+ (NSData *)AES256decrypt:(NSData *)srcData key:(NSString *)key {
  CCOptions cco = kCCOptionPKCS7Padding;
  return [SySecurityUtil doCipher:srcData
                              key:[key dataUsingEncoding:NSUTF8StringEncoding]
                          context:kCCDecrypt
                          padding:&cco];
}

@end
