//
//  BaseNetworkService.h
//  WLCommonLibrary
//
//  Created by lienbao on 14-2-10.
//  Copyright (c) 2014年 wei64. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

static const double kTimeOutNetWork = 6.0f;

@interface NetworkService : NSObject

@property (nonatomic, assign) NSTimeInterval timeoutInterval;

+ (instancetype)service;

- (instancetype )initWithBaseServiceURL:(NSString *)baseServiceURL;

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                HTTPMethod:(NSString *)httpMethod
                                    params:(NSDictionary *)params
                 constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block;

- (NSString *)baseUrl:(NSString *)method;

- (NSDictionary *)responseObjectBody:(id)responseObject error:(NSError **)error;

- (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params;

- (NSMutableDictionary *)commonWithParams:(NSDictionary *)params;

- (NSURL *)buildURLWithMethod:(NSString *)method params:(NSDictionary *)params;

@end
