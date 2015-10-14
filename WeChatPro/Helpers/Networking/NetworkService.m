//
//  BaseNetworkService.m
//  WLCommonLibrary
//
//  Created by lienbao on 14-2-10.
//  Copyright (c) 2014年 wei64. All rights reserved.
//

#import "NetworkService.h"
#import "UIDevice+IdentifierAddition.h"

@interface NetworkService ()

@property (nonatomic, strong) NSString *baseURL;

@end

@implementation NetworkService

+ (instancetype)service
{
    return [[[self class] alloc] initWithBaseServiceURL:@""];
}

- (instancetype)initWithBaseServiceURL:(NSString *)baseServiceURL
{
    self = [super init];
    if (self) {
        self.baseURL = baseServiceURL;
        self.timeoutInterval = kTimeOutNetWork;
    }
    return self;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                HTTPMethod:(NSString *)httpMethod
                                    params:(NSDictionary *)params
                 constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[self buildURLWithMethod:method params:params]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:self.timeoutInterval];
    [request setHTTPMethod:httpMethod];
    return request;
}

- (NSDictionary *)responseObjectBody:(id)responseObject error:(NSError **)error
{
    error = nil;
    return nil;
}

- (NSMutableDictionary *)commonWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsDic = nil;
    if (params) {
        paramsDic = [NSMutableDictionary dictionaryWithDictionary:params];
    } else {
        paramsDic = [NSMutableDictionary dictionary];
    }
    return paramsDic;
}

- (NSString *)baseUrl:(NSString *)method
{
    return [NSString stringWithFormat:@"%@%@?", self.baseURL, method];
}

- (NSURL *)buildURLWithMethod:(NSString *)method params:(NSDictionary *)params
{
    NSString *baseUrl = [self baseUrl:method];
    NSMutableDictionary *paramsDic = [self commonWithParams:params];
    NSString *requestStr = [self serializeURL:baseUrl params:paramsDic];
    if (!requestStr) {
        return nil;
    }
    return [NSURL URLWithString:requestStr];
}

- (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params
{
    NSMutableString *paramsString = [NSMutableString string];
    for (NSString *key in [params allKeys]) {
        NSString *value = [params objectForKey:key];
        if ([value isKindOfClass:[NSNumber class]]) {
            value = [(NSNumber *)value stringValue];
        }
        
        if ([value isKindOfClass:[NSString class]] && [value length] ){
            value = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            if ([paramsString length]) {
                [paramsString appendFormat:@"&%@=%@", key, value];
            }else {
                [paramsString appendFormat:@"%@=%@", key, value];
            }
        }
    }
    return [NSString stringWithFormat:@"%@%@", baseURL, paramsString];
}

@end
