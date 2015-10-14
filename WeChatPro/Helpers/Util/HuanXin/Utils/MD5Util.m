//
//  MD5Util.m
//  Smilepath
//
//  Created by panbin on 13-6-21.
//  Copyright (c) 2013年 panbin. All rights reserved.
//

#import "MD5Util.h"
#import "CommonCrypto/CommonDigest.h"

@implementation MD5Util

+(NSString *)doMD5Encode:(NSString *)inPutText {
    
    if(self == nil || [inPutText length] == 0)
        return nil;
    
    const char *value = [inPutText UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (unsigned)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}


@end
