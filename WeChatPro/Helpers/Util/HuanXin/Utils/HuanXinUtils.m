//
//  HuanXinUtils.m
//  YRJJApp
//
//  Created by panbin on 15/2/6.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import "HuanXinUtils.h"
#import "MD5Util.h"

@implementation HuanXinUtils

+ (HuanXinUtils *)sharedManager
{
    static HuanXinUtils *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[HuanXinUtils alloc] init];
    });
    
    return shareManager;
}


- (void)loginHuanXin
{
    NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"HXuserName"];
    NSString *md5Str = [[NSUserDefaults standardUserDefaults] objectForKey:@"HXPswd"];
    
    if ([userName length] > 0 && [md5Str length] > 0) {
        
        if ([[EaseMob sharedInstance].chatManager isLoggedIn]) {
            [[EaseMob sharedInstance].chatManager logoffWithError:nil];
        }
        
        
        [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:userName password:md5Str completion:^(NSDictionary *loginInfo, EMError *error) {
            if (!error && loginInfo) {
                // [[EaseMob sharedInstance].chatManager setApnsNickname:userName];
                
                //设置自动登录
                /*
                 此属性如果被设置为YES, 会在以下几种情况下被重置为NO:
                 1. 用户发起的登出动作;
                 2. 用户在别的设备上更改了密码, 导致此设备上自动登陆失败;
                 3. 用户的账号被从服务器端删除;
                 4. 用户从另一个设备把当前设备上登陆的用户踢出.
                 */
                [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
            }
            else {
            }
        } onQueue:nil];
    }
    

//        BOOL isAutoLogin = [[EaseMob sharedInstance].chatManager isAutoLoginEnabled];
//        
//        if (!isAutoLogin) {
//            //调用环信登陆
//            [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:userName password:md5Str completion:^(NSDictionary *loginInfo, EMError *error) {
//                if (!error && loginInfo) {
//                   // [[EaseMob sharedInstance].chatManager setApnsNickname:userName];
//                    
//                    //设置自动登录
//                    /*
//                     此属性如果被设置为YES, 会在以下几种情况下被重置为NO:
//                     1. 用户发起的登出动作;
//                     2. 用户在别的设备上更改了密码, 导致此设备上自动登陆失败;
//                     3. 用户的账号被从服务器端删除;
//                     4. 用户从另一个设备把当前设备上登陆的用户踢出.
//                     */
//                    [[EaseMob sharedInstance].chatManager setIsAutoLoginEnabled:YES];
//                }
//                else {
//                    NSLog(@"登录失败-->%@", error.description);
//                }
//            } onQueue:nil];
//        }
//        
//    }
    
}


- (void)saveHuanXinUserNameAndPasswd:(NSString *)userId
{
    NSString *userName = [NSString stringWithFormat:@"id%@", userId];
    NSString *passWd = [MD5Util doMD5Encode:userName];
    
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"HXuserName"];
    [[NSUserDefaults standardUserDefaults] setObject:passWd forKey:@"HXPswd"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:userName password:passWd withCompletion:^(NSString *username, NSString *password, EMError *error) {
        if (!error) {
        }
    } onQueue:nil];
}

@end
