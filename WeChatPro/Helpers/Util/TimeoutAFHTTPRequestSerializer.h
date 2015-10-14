//
//  TimeoutAFHTTPRequestSerializer.h
//  YRJJApp
//
//  Created by luwelong on 15/1/4.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import "AFURLRequestSerialization.h"

@interface TimeoutAFHTTPRequestSerializer : AFHTTPRequestSerializer
@property(nonatomic,assign)NSTimeInterval timeOut;
- (id)initWithTimeout:(NSTimeInterval)timeout;
@end
