//
//  ArtistService.m
//  Artist
//
//  Created by lienbao on 15/4/21.
//  Copyright (c) 2015年 lienbao. All rights reserved.
//

#import "ArtistService.h"
#import "UIDevice+IdentifierAddition.h"
#import "NSObject+NSJSONSerialization.h"

@implementation ArtistService

+ (id)service
{
    static dispatch_once_t pred;
    static ArtistService *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[ArtistService alloc] initWithBaseServiceURL:kArtistServiceUrl];
    });
    return sharedInstance;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                HTTPMethod:(NSString *)httpMethod
                                    params:(NSDictionary *)params
                 constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
{
    NSMutableURLRequest *request = nil;
    if ([httpMethod isEqualToString:@"POST"]) {
        request = [NSMutableURLRequest requestWithURL:[self buildURLWithMethod:method params:@{}]
                                          cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                      timeoutInterval:self.timeoutInterval];
        
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSString *paramStr = [params JSONRepresentation];
        [request setHTTPBody:[paramStr dataUsingEncoding:NSUTF8StringEncoding]];
        
    }else {
        request = [NSMutableURLRequest requestWithURL:[self buildURLWithMethod:method params:params]
                                          cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                      timeoutInterval:self.timeoutInterval];
    }
    [request setHTTPMethod:httpMethod];
    return request;
}

- (NSMutableDictionary *)commonWithParams:(NSDictionary *)params
{
    NSMutableDictionary *paramsDic = nil;
    if (params) {
        paramsDic = [NSMutableDictionary dictionaryWithDictionary:params];
    } else {
        paramsDic = [NSMutableDictionary dictionary];
    }
    
    [paramsDic setObject:@"jiazu"       forKey:@"app"];
    [paramsDic setObject:[UIDevice appVersion]    forKey:@"ver"];
    
    [paramsDic setObject:[UIDevice idfa]          forKey:@"deviceId"];
    [paramsDic setObject:[UIDevice deviceType]    forKey:@"deviceType"];
    
    [paramsDic setObject:[UIDevice systemName]    forKey:@"appType"];
    [paramsDic setObject:[UIDevice systemVersion] forKey:@"systemVersion"];
    
    NSString *uid = [[NSUserDefaults standardUserDefaults] objectForKey:serviceUidKey];
    if (![params objectForKey:@"userId"] && [uid length]) {
        [paramsDic setObject:uid forKey:@"userId"];
    }
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:serviceTokenKey];
    if (![params objectForKey:@"token"] && [token length]) {
        [paramsDic setObject:token forKey:@"token"];
    }
    
    return paramsDic;
}

- (NSDictionary *)responseObjectBody:(id)responseObject error:(NSError **)error
{
    *error = [NSError errorWithDomain:[[self class] description]
                                 code:0
                             userInfo:@{NSLocalizedFailureReasonErrorKey:@"获取数据失败",
                                        NSLocalizedDescriptionKey:@"获取数据失败"}];
    NSDictionary *body = nil;
    if (![responseObject isKindOfClass:[NSDictionary class]]) {
        return body;
    }
    
    NSNumber *status = responseObject[@"status"];
    if ( [status boolValue] ) {
        *error = nil;
        body = responseObject[@"data"];
    }else {
        *error = [NSError errorWithDomain:[[self class] description]
                                     code:0
                                 userInfo:@{NSLocalizedFailureReasonErrorKey:responseObject[@"message"],
                                            NSLocalizedDescriptionKey:responseObject[@"message"]}];
    }
    return body;
}


@end
