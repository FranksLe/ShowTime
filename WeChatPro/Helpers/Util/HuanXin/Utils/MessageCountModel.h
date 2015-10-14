//
//  MessageCountModel.h
//  YRJJApp
//
//  Created by panbin on 15/2/3.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageCountModel : NSObject<NSCoding>

@property (nonatomic, assign) NSInteger messageCount;

/**
 *  1 消息 2 评论 3 job
 */
@property (nonatomic, assign) NSInteger messageType;


@end
