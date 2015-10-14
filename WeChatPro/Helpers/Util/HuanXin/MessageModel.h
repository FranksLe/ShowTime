//
//  MessageModel.h
//  YRJJApp
//
//  Created by panbin on 15/1/24.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (nonatomic, strong) NSString *messageContext;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *userId;


+ (MessageModel *)praseParmas:(NSDictionary *)item;

@end
