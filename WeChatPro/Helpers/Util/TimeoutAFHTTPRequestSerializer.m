//
//  TimeoutAFHTTPRequestSerializer.m
//  YRJJApp
//
//  Created by luwelong on 15/1/4.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import "TimeoutAFHTTPRequestSerializer.h"

@implementation TimeoutAFHTTPRequestSerializer
@synthesize timeOut;
- (id)initWithTimeout:(NSTimeInterval)timeout{
    self = [super init];
    if (self) {
        self.timeOut = timeout;
    }
    return self;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                 URLString:(NSString *)URLString
                                parameters:(NSDictionary *)parameters
                                     error:(NSError *__autoreleasing *)error
{
    NSMutableURLRequest *request = [super requestWithMethod:method URLString:URLString parameters:parameters error:error];
    
    if (self.timeOut > 0) {
        [request setTimeoutInterval:self.timeOut];
    }
    return request;
}

@end
