//
//  HuanXinUtils.h
//  YRJJApp
//
//  Created by panbin on 15/2/6.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EaseMob.h"

@interface HuanXinUtils : NSObject

+ (HuanXinUtils *)sharedManager;

- (void)loginHuanXin;

- (void)saveHuanXinUserNameAndPasswd:(NSString *)userId;

@end
