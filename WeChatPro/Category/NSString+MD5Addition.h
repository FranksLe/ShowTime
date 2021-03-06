//
//  NSString+MD5Addition.h
//  UIDeviceAddition
//
//  Created by Georg Kitz on 20.08.11.
//  Copyright 2011 Aurora Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(MD5Addition)

- (NSString *) md5;
- (NSString *) stringFromMD5;

+ (BOOL)isValidatePhoneNumber:(NSString *)phoneNumber;

+ (NSString *)stringFromCurrentDate;

- (NSString *)URLEncodedString;

@end
