//
//  NetworkManager.m
//  OO
//
//  Created by lienbao on 19/06/2014.
//  Copyright (c) 2014 B5M. All rights reserved.
//

#import "NetworkManager.h"
#import "NSObject+NSJSONSerialization.h"
#import "ArtistService.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "AppMacro.h"

@interface NetworkManager ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, assign) BOOL enableDebug;

@end

@implementation NetworkManager

+ (NetworkManager *)sharedInstance
{
    static dispatch_once_t pred;
    static NetworkManager *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[NetworkManager alloc] init];
        sharedInstance.operationQueue = [[NSOperationQueue alloc] init];
        sharedInstance.defaultService = [ArtistService service];
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
#if DEBUG
        [sharedInstance enableDebug:YES];
#endif
    });
    return sharedInstance;
}

+ (void)cancelRequestID:(TSRequestID)request
{
    if ([request isExecuting]) {
        [request cancel];
    }
}

//判断网络是否链接
+(BOOL) isConnectionAvailable{
    
    BOOL isExistenceNetwork = NO;
    Reachability *reach = [Reachability reachabilityWithHostName:@"api.jiazu.co"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    
    return isExistenceNetwork;
}

- (void)setToken:(NSString *)token andUid:(NSString *)uid
{
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:serviceTokenKey];
    [[NSUserDefaults standardUserDefaults] setObject:uid forKey:serviceUidKey];
}

- (void)cancelAllRequest
{
    [self.operationQueue cancelAllOperations];
}

#pragma mark - debug method
- (void)enableDebug:(BOOL)enable
{
    _enableDebug = enable;
}

- (void)printRequestInfo:(TSRequestID)requestID
{
    if (_enableDebug) {
        NSURLRequest *request = ((AFHTTPRequestOperation *)requestID).request;
        DLog(@"request:%@",request);
        DLog(@"request method:%@",[request HTTPMethod]);
        DLog(@"request head:%@",[request allHTTPHeaderFields]);
        DLog(@"request body:%@",[[NSString alloc] initWithData:[request HTTPBody] encoding:NSUTF8StringEncoding]);
    }
}

//GET
- (TSRequestID)GET:(NSString *)method
            params:(NSDictionary *)params
           success:(void (^)(id responseObject))success
           failure:(void (^)(NSError *error))failure
{
    return [self GETWithService:self.defaultService
                         method:method
                         params:params
      constructingBodyWithBlock:nil
                        success:success
                        failure:failure];
}

- (TSRequestID)GETWithService:(NetworkService *)service
                       method:(NSString *)method
                       params:(NSDictionary *)params
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure
{
    return [self GETWithService:service
                         method:method
                         params:params
      constructingBodyWithBlock:nil
                        success:success
                        failure:failure];
}

- (TSRequestID)GETWithService:(NetworkService *)service
                       method:(NSString *)method
                       params:(NSDictionary *)params
    constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure
{
    return [self requestWithService:service
                             method:method
                         HTTPMethod:@"GET"
                             params:params
          constructingBodyWithBlock:block
                            success:success
                            failure:failure];
}

//POST
- (TSRequestID)POST:(NSString *)method
             params:(NSDictionary *)params
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure
{
    return [self POSTWithService:self.defaultService
                          method:method
                          params:params
                         success:success
                         failure:failure];
}

- (TSRequestID)POST:(NSString *)method
             params:(NSDictionary *)params
              block:(void (^)(id <AFMultipartFormData> formData))block
            success:(void (^)(id responseObject))success
            failure:(void (^)(NSError *error))failure
{
    return [self POSTWithService:self.defaultService
                          method:method
                          params:params
       constructingBodyWithBlock:block
                         success:success
                         failure:failure];
}


- (TSRequestID)POSTWithService:(NetworkService *)service
                        method:(NSString *)method
                        params:(NSDictionary *)params
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure
{
    return [self POSTWithService:service
                          method:method
                          params:params
       constructingBodyWithBlock:nil
                         success:success
                         failure:failure];
}

- (TSRequestID)POSTWithService:(NetworkService *)service
                        method:(NSString *)method
                        params:(NSDictionary *)params
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure
{
    return [self requestWithService:service
                             method:method
                         HTTPMethod:@"POST"
                             params:params
          constructingBodyWithBlock:block
                            success:success
                            failure:failure];
}

- (TSRequestID)requestWithService:(NetworkService *)service
                           method:(NSString *)method
                       HTTPMethod:(NSString *)HTTPMethod
                           params:(NSDictionary *)params
        constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:[service requestWithMethod:method HTTPMethod:HTTPMethod params:params constructingBodyWithBlock:block]];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    operation.securityPolicy = securityPolicy;
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseContent = [operation.responseString JSONValue];
        
        if (_enableDebug) {
//            DFLog(@"\n***************** ******            *********************\n");
//            DFLog(@"\n***************** method:%@ response****************\n", method);
//            DFLog(@"\n***************** ******            *********************\n");
//            DLog(@"NetworkManager method:%@ body:%@", method, operation);
//            DLog(@"NetworkManager method:%@ response:%@", method, responseContent);
        }
//        if ([[NSString stringWithFormat:@"%@",[responseContent objectForKey:@"errorCode"]] isEqualToString:@"101"]) {
//            [PersonInformation logOut];
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"chongxindenglune" object:responseObject];
//        }
        NSError *error = nil;
        NSDictionary *body = [service responseObjectBody:responseContent error:&error];
        if (error) {
//            DFLog(@"\n***************** ******            *********************\n");
//            DFLog(@"\n***************** method:%@ error:%@****************\n", method, error);
//            DFLog(@"\n***************** ******            *********************\n");
            if (failure) {
                failure(error);
            }
        } else {
            if (success) {
                success(body);
            }
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        DFLog(@"\n***************** ******            *********************\n");
//        DFLog(@"\n***************** method:%@ error:%@****************\n", method, error);
//        DFLog(@"\n***************** ******            *********************\n");
        if (failure) {
            failure(error);
        }
    }];
    [self printRequestInfo:operation];
    [self.operationQueue addOperation:operation];
    return operation;
}

- (TSRequestID)ResourceWithService:(NetworkService *)service
                            method:(NSString *)method
                            params:(NSDictionary *)params
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:[service requestWithMethod:method HTTPMethod:@"GET" params:params constructingBodyWithBlock:nil]];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    operation.securityPolicy = securityPolicy;
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
    
    [self printRequestInfo:operation];
    [self.operationQueue addOperation:operation];
    return operation;
}

#pragma mark - 
#pragma mark AFNTool
#pragma mark -
#pragma mark -- 请求数据方法
+ (void)requestWithPath:(NSString *)path
                 Params:(NSDictionary *)params
                 Method:(NSString *)method
                Success:(HttpSuccessBlock)success
                Failure:(HttpFailureBlock)failure{
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@",kBaseUrl,path];
    
    //创建请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //请求数据的格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 4.0;
    //    manager.requestSerializer = [[TimeoutAFHTTPRequestSerializer alloc]initWithTimeout:8.0];
    
    //缓存策略
    //1、NSURLRequestUseProtocolCachePolicy NSURLRequest默认的cache policy，使用Protocol协议定义。
    //2、NSURLRequestReloadIgnoringCacheData 忽略缓存直接从原始地址下载。
    //3、NSURLRequestReturnCacheDataElseLoad 只有在cache中不存在data时才从原始地址下载。
    //4、NSURLRequestReturnCacheDataDontLoad 只使用cache数据，如果不存在cache，请求失败；用于没有建立网络连接离线模式；
    //5、NSURLRequestReloadIgnoringLocalAndRemoteCacheData：忽略本地和远程的缓存数据，直接从原始地址下载，与NSURLRequestReloadIgnoringCacheData类似。
    //6NSURLRequestReloadRevalidatingCacheData:验证本地数据与远程数据是否相同，如果不同则下载远程数据，否则使用本地数据。
    manager.requestSerializer.cachePolicy = NSURLRequestReloadRevalidatingCacheData;
    
    //[manager.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *_tmpArray = [NSArray arrayWithArray:[cookieJar cookies]];
    for (id obj in _tmpArray) {
        [cookieJar deleteCookie:obj];
    }
    
    //从NSUserDefaults中取出cookie并设置
    NSData *cookiesData = [[NSUserDefaults standardUserDefaults]objectForKey:kUserDefaultsCookie];
    if ([cookiesData length]) {
        NSMutableArray *cookies = [NSMutableArray array];
        cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesData];
        for (NSHTTPCookie *cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }
    
    if ([method isEqualToString:@"POST"]) {   //发送post请求
        
        [manager POST:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //传递数据
            success(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(operation);
            //取消请求
            [[manager operationQueue] cancelAllOperations];
        }];
        
    }else if ([method isEqualToString:@"GET"]){   //发送get请求
        
        [manager GET:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            success(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(operation);
            //取消请求
            [[manager operationQueue] cancelAllOperations];
        }];
        
    }
    
}




/*-----------------登陆时因要取得用户的UserId以及Cookie故定义该方法-------------------*/
#pragma mark -- 登陆方法----取得UserId和cookie并存入本地
+ (void)loginRequestWithPath:(NSString *)path
                      Params:(NSDictionary *)paramsDic
                     Success:(HttpSuccessBlock)success
                     Failure:(HttpFailureBlock)failure{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@",kBaseUrl,path];
    //发送post请求
    [manager POST:urlStr parameters:paramsDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
        
        //取得Cookie并以字符串保存
        //NSString *cookieStr = [[operation.response allHeaderFields]objectForKey:@"Set-Cookie" ];
        //调用方法截取其中的cookie并保存在NSUserDefaults中
        //NSLog(@"cookieStr = %@",cookieStr);
        //[self getCookieAndSave:cookieStr beginIndex:22 finishStr:@";"];
        
        //         NSArray *cookieString = [[operation.response allHeaderFields] valueForKey:@"Set-Cookie"];
        //        NSLog(@" cookieString = %@",cookieString);
        
        //取得cookie并存入NSUserDefaults
        [self getCookieNoCutAndSave:urlStr];
        
        //将数据(userId)存入NSUserDefaults中
        NSDictionary *data = [responseObject objectForKey:@"data"];
        if (![data isKindOfClass:[NSNull class]]) {
            NSString *userID = [data objectForKey:@"UserId"];
            NSString *NickName = [data objectForKey:@"NickName"];
            [[NSUserDefaults standardUserDefaults]setObject:NickName forKey:kLoginUserName];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [self SaveUserIdToUserDefaults:userID];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation);
    }];
}

/*--------------只传入一个NSString类型的参数（不是键值对）故定义该方法-----------------*/
#pragma mark -- 获取验证码
//注册时调用
+ (void)requestPostWithPath:(NSString *)path
               ParamsString:(NSString *)params
                     Method:(NSString *)method
                    Success:(HttpSuccessBlock)success{
    
    
    NSString *strPath = [NSString stringWithFormat:@"%@/%@",kBaseUrl,path];
    //NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)strPath,  NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8 ));
    
    NSURL *url = [NSURL URLWithString:strPath];
    NSMutableURLRequest *post = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
    
    // NSLog(cookie = %@)
    
    [post setHTTPMethod:method];
    
    NSData *data = [params dataUsingEncoding:NSUTF8StringEncoding];
    
    [post setHTTPBody:data];
    //设置请求发送数据格式
    [post setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    NSData *receiveData = [NSURLConnection sendSynchronousRequest:post returningResponse:nil error:nil];
    //NSLog(@" receiveData = %@",receiveData);
    NSDictionary *dic;
    if (receiveData) {
        dic = [NSJSONSerialization JSONObjectWithData:receiveData options:NSJSONReadingAllowFragments error:nil];
        success(dic);
    }
}


#pragma mark -- 注册方法
+ (void)registerRequestWithPath:(NSString *)path
                         Params:(NSDictionary *)paramsDic
                        Success:(HttpSuccessBlock)success
                        Failure:(HttpFailureBlock)failure{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@",kBaseUrl,path];
    
    //设置超时时间
    manager.requestSerializer = [[TimeoutAFHTTPRequestSerializer alloc]initWithTimeout:12.0];
    
    //发送post请求
    [manager POST:urlStr parameters:paramsDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
        
        //取得cookie并存入NSUserDefaults
        [self getCookieNoCutAndSave:urlStr];
        
        //将数据(userId)存入NSUserDefaults中
        NSDictionary *data = [responseObject objectForKey:@"data"];
        if (![data isKindOfClass:[NSNull class]]) {
            NSString *userID = [data objectForKey:@"UserId"];
            [self SaveUserIdToUserDefaults:userID];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(operation);
        
    }];
}

+ (void)upLoadImagePath:(NSString *)httpPath
              ImageName:(NSString *)imageName
              Parameter:(NSDictionary *)params
              ImageData:(NSData *)imageData
                Success:(HttpSuccessBlock)success{
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",kBaseUrl,httpPath];
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData name:imageName fileName:imageName mimeType:@"image/jpeg"];
        //[formData appendPartWithFormData:imageData name:imageName];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
        // NSLog(@"上传图片SuccessMessage:%@",[responseObject objectForKey:@"message"] );
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

//上传多张图片
+ (void)upLoadMultiImageToThePath:(NSString *)httpPath       //路径
                      theImageDic:(NSDictionary *)imageDic   //存放图片数据的字典
                           Params:(NSDictionary *)params     //需要同时上传的其他数据
                          Success:(HttpSuccessBlock)success
                          Failure:(HttpFailureBlock)failure{
    NSString *url = [NSString stringWithFormat:@"%@/%@",kBaseUrl,httpPath];
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (NSString *keyName in imageDic) {
            
            
            [formData appendPartWithFileData:[imageDic objectForKey:keyName] name:keyName fileName:keyName mimeType:@"image/png"];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
        
        // NSLog(@"上传图片SuccessMessage:%@",[responseObject objectForKey:@"message"] );
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation);
        }
    }];
    
}

#pragma mark --不传送Cookie
+ (void)weiBoRequestWithPath:(NSString *)path
                      Params:(NSDictionary *)paramsDic
                      Method:(NSString *)method
                     Success:(HttpSuccessBlock)success
                     Failure:(HttpFailureBlock)failure{
    //创建请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/%@",path];
    //请求数据的格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //设置返回数据的格式
    // manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    if ([method isEqualToString:@"POST"]) {   //发送post请求
        
        [manager POST:urlStr parameters:paramsDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //传递数据
            success(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(operation);
            }
        }];
        
    }else if ([method isEqualToString:@"GET"]){   //发送get请求
        
        [manager GET:urlStr parameters:paramsDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            success(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(operation);
            }
        }];
        
    }
}


#pragma mark -- 获取cookie并存入NSUserDefaults
+ (void)getCookieNoCutAndSave:(NSString *)urlStr{
    
    NSArray *cookiesArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:urlStr]];
    //NSLog(@"cookiesArray = %@",cookiesArray);
    if (cookiesArray.count) {
        NSData *data =  [NSKeyedArchiver archivedDataWithRootObject:cookiesArray];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserDefaultsCookie];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    // NSString *cookie = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsCookie];
    //NSLog(@"kUserDefaultsCookie = %@",cookie);
}

#pragma mark -- 存储UserID数据至NSUserDefaults
+ (void)SaveUserIdToUserDefaults:(NSString *)userIdData{
    
    //NSLog(@"userIdData = %@",userIdData);
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userIdData forKey:kTheUserID];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:kTheUserID];
    //NSLog(@"kTheUserID = %@",userId);
}


#pragma mark -- 第三方登录
+ (void)requestAndGetCookieWithPath:(NSString *)path
                             Params:(NSDictionary *)params
                             Method:(NSString *)method
                            Success:(HttpSuccessBlock)success
                            Failure:(HttpFailureBlock)failure{
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@",kBaseUrl,path];
    
    //创建请求
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    //请求数据的格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 4.0;
    
    manager.requestSerializer.cachePolicy = NSURLRequestReloadRevalidatingCacheData;
    
    if ([method isEqualToString:@"POST"]) {   //发送post请求
        
        [manager POST:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //传递数据
            success(responseObject);
            //存储Cookie
            NSArray *cookiesArray = [[operation.response allHeaderFields] valueForKey:@"Set-Cookie"];
            NSData *data =  [NSKeyedArchiver archivedDataWithRootObject:cookiesArray];
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:kUserDefaultsCookie];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(operation);
            //NSLog(@" post %@",failure);
            //取消请求
            [[manager operationQueue] cancelAllOperations];
        }];
        
    }else if ([method isEqualToString:@"GET"]){   //发送get请求
        
        [manager GET:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            success(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(operation);
            //NSLog(@" get %@",failure);
            //取消请求
            [[manager operationQueue] cancelAllOperations];
        }];
        
    }
    
}

@end
