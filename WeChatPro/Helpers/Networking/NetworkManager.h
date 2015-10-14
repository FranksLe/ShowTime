//
//  NetworkManager.h
//  OO
//
//  Created by lienbao on 19/06/2014.
//  Copyright (c) 2014 B5M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkService.h"
#import "TimeoutAFHTTPRequestSerializer.h"
#import "MessageMacro.h"
//#import "PersonInformation.h"
#import "Reachability.h"

typedef NSOperation* TSRequestID;

@interface NetworkManager : NSObject

@property (nonatomic, assign) NSTimeInterval timeoutInterval;
@property (nonatomic, strong) NetworkService *defaultService;

typedef void(^HttpSuccessBlock)(id JSON);
typedef void(^HttpFailureBlock)(AFHTTPRequestOperation *failure);

+ (NetworkManager *)sharedInstance;
+ (void)cancelRequestID:(TSRequestID)request;

//判断网络是否链接
+ (BOOL) isConnectionAvailable;

- (void)setToken:(NSString *)token andUid:(NSString *)uid;
- (void)cancelAllRequest;
- (void)enableDebug:(BOOL)enable;

//GET
- (TSRequestID)GET:(NSString *)method
            params:(NSDictionary *)params
           success:(void (^)(id responseObject))success
           failure:(void (^)(NSError *error))failure;

- (TSRequestID)GETWithService:(NetworkService *)service
                       method:(NSString *)method
                       params:(NSDictionary *)params
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

- (TSRequestID)GETWithService:(NetworkService *)service
                        method:(NSString *)method
                        params:(NSDictionary *)params
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

//POST
- (TSRequestID)POST:(NSString *)method
             params:(NSDictionary *)params
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure;

- (TSRequestID)POST:(NSString *)method
             params:(NSDictionary *)params
              block:(void (^)(id <AFMultipartFormData> formData))block
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure;


- (TSRequestID)POSTWithService:(NetworkService *)service
                       method:(NSString *)method
                       params:(NSDictionary *)params
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

- (TSRequestID)POSTWithService:(NetworkService *)service
                       method:(NSString *)method
                       params:(NSDictionary *)params
    constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

- (TSRequestID)ResourceWithService:(NetworkService *)service
                        method:(NSString *)method
                        params:(NSDictionary *)params
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

//AFNTool

//发送字典（key和value）
+ (void)requestWithPath:(NSString *)path
                 Params:(NSDictionary *)params
                 Method:(NSString *)method
                Success:(HttpSuccessBlock)success
                Failure:(HttpFailureBlock)failure;



//只发送key(NSString)
+ (void)requestPostWithPath:(NSString *)path
               ParamsString:(NSString *)params
                     Method:(NSString *)method
                    Success:(HttpSuccessBlock)success;


//登陆界面调用该方法（此方法中需要取出userid以及cookie并存起来）
+ (void)loginRequestWithPath:(NSString *)path
                      Params:(NSDictionary *)paramsDic
                     Success:(HttpSuccessBlock)success
                     Failure:(HttpFailureBlock)failure;

//普通注册调用
+ (void)registerRequestWithPath:(NSString *)path
                         Params:(NSDictionary *)paramsDic
                        Success:(HttpSuccessBlock)success
                        Failure:(HttpFailureBlock)failure;


//上传图片
+ (void)upLoadImagePath:(NSString *)httpPath
              ImageName:(NSString *)imageName
              Parameter:(NSDictionary *)params
              ImageData:(NSData *)imageData
                Success:(HttpSuccessBlock)success;

//上传多张图片
+ (void)upLoadMultiImageToThePath:(NSString *)httpPath       //路径
                      theImageDic:(NSDictionary *)imageDic   //存放图片数据的字典
                           Params:(NSDictionary *)params     //需要同时上传的其他数据
                          Success:(HttpSuccessBlock)success
                          Failure:(HttpFailureBlock)failure;

//获取微博的请求
+ (void)weiBoRequestWithPath:(NSString *)path
                      Params:(NSDictionary *)paramsDic
                      Method:(NSString *)method
                     Success:(HttpSuccessBlock)success
                     Failure:(HttpFailureBlock)failure;

#pragma mark -- 获取cookie并存入NSUserDefaults
+ (void)getCookieNoCutAndSave:(NSString *)urlStr;
#pragma mark -- 存储UserID数据至NSUserDefaults
+ (void)SaveUserIdToUserDefaults:(NSString *)userIdData;

//第三方登录
+ (void)requestAndGetCookieWithPath:(NSString *)path
                             Params:(NSDictionary *)params
                             Method:(NSString *)method
                            Success:(HttpSuccessBlock)success
                            Failure:(HttpFailureBlock)failure;

@end