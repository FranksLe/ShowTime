//
//  MessageCountUtils.h
//  YRJJApp
//
//  Created by panbin on 15/2/3.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageCountUtils : NSObject

+ (MessageCountUtils *)sharedManager;


- (void)saveMessages:(NSDictionary *)mesageExt;

- (NSArray *)getMessageContents;

- (void)clearMessageCount;

- (void)clearSiXinCount;

- (void)setVauleInChatController:(NSString *)vaule;

- (BOOL)isInChatController;

- (NSInteger)getMessageAllCount;

@end
