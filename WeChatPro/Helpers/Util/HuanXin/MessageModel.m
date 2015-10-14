//
//  MessageModel.m
//  YRJJApp
//
//  Created by panbin on 15/1/24.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

+ (MessageModel *)praseParmas:(NSDictionary *)item
{
    MessageModel *model = [[MessageModel alloc] init];
    
    if (item == nil) {
        return model;
    }
    
    NSDictionary *apsItem = [item objectForKey:@"aps"];
    
    if (apsItem != nil) {
       model.messageContext = [apsItem objectForKey:@"alert"];
    }
    
    
    NSDictionary *keyMap = [item objectForKey:@"content"];
    
    if (keyMap != nil) {
        model.nickName = [keyMap objectForKey:@"nickname"];
        model.userId = [keyMap objectForKey:@"userid"];
    }
    
    
    return model;
    
}

@end
