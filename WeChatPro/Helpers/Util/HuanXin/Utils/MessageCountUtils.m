//
//  MessageCountUtils.m
//  YRJJApp
//
//  Created by panbin on 15/2/3.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import "MessageCountUtils.h"
#import "MessageCountModel.h"

@implementation MessageCountUtils

+ (MessageCountUtils *)sharedManager
{
    static MessageCountUtils *httpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [[MessageCountUtils alloc] init];
    });
    
    return httpManager;
}


- (void)saveMessages:(NSDictionary *)mesageExt
{
    if (mesageExt) {
        //私信
        NSString *messageCount = [mesageExt objectForKey:@"message"];
        
        if ([messageCount integerValue] > 0) {
            MessageCountModel *messageModel = [[MessageCountModel alloc] init];
            messageModel.messageCount = [messageCount integerValue];
            messageModel.messageType = 1;
            
            //set ndata
            NSData *messageData = [NSKeyedArchiver archivedDataWithRootObject:messageModel];
            
            [[NSUserDefaults standardUserDefaults] setValue:messageData forKey:@"messageData"];
        }
        else {
            [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"messageData"];
        }
        
        
        //评论
        NSString *commentCount = [mesageExt objectForKey:@"commnet"];
        
        if ([commentCount integerValue] > 0) {
            MessageCountModel *commentModel = [[MessageCountModel alloc] init];
            commentModel.messageCount = [commentCount integerValue];
            commentModel.messageType = 2;
            
            //set ndata
            NSData *commentData = [NSKeyedArchiver archivedDataWithRootObject:commentModel];
            
            [[NSUserDefaults standardUserDefaults] setValue:commentData forKey:@"commentData"];
        }
        else {
            [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"commentData"];
        }
        
       
        
        //工作
        NSString *jobCount = [mesageExt objectForKey:@"job"];
        
        if ([jobCount integerValue] > 0) {
            MessageCountModel *jobModel = [[MessageCountModel alloc] init];
            jobModel.messageCount = [jobCount integerValue];
            jobModel.messageType = 3;
            //set ndata
            NSData *jobData = [NSKeyedArchiver archivedDataWithRootObject:jobModel];
            
            //save data
            [[NSUserDefaults standardUserDefaults] setValue:jobData forKey:@"jobData"];
        }
        else {
            [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"jobData"];
        }
        
        
        
        NSString *zanCount = [mesageExt objectForKey:@"praise"];
        
        if ([zanCount integerValue] > 0) {
            MessageCountModel *zanModel = [[MessageCountModel alloc] init];
            zanModel.messageCount = [zanCount integerValue];
            zanModel.messageType = 4;
            //set ndata
            NSData *zanData = [NSKeyedArchiver archivedDataWithRootObject:zanModel];
            
            //save data
            [[NSUserDefaults standardUserDefaults] setValue:zanData forKey:@"zanData"];
        }
        else {
            [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"zanData"];
        }
        
        
       
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

/**
 *  严格按照顺序来取
 *
 *  @return
 */
- (NSArray *)getMessageContents
{
    NSMutableArray *contents = [[NSMutableArray alloc] init];
    
    NSData *messageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageData"];
    
    if (messageData) {
        MessageCountModel *messageModel = [NSKeyedUnarchiver unarchiveObjectWithData:messageData];
        
        if (messageModel) {
            NSInteger messageCount = messageModel.messageCount;
            //数量大于1
            if (messageCount > 0) {
                [contents addObject:messageModel];
            }
        }
    }
    
    
    
    NSData *commentData = [[NSUserDefaults standardUserDefaults] objectForKey:@"commentData"];
    
    if (commentData) {
        MessageCountModel *commentModel = [NSKeyedUnarchiver unarchiveObjectWithData:commentData];
        
        if (commentModel) {
            NSInteger commnetCount = commentModel.messageCount;
            
            if (commnetCount > 0) {
                [contents addObject:commentModel];
            }
        }

    }
    
    
    NSData *jobData = [[NSUserDefaults standardUserDefaults] objectForKey:@"jobData"];
    
    if (jobData) {
        MessageCountModel *jobModel = [NSKeyedUnarchiver unarchiveObjectWithData:jobData];
        
        if (jobModel) {
            NSInteger jobCount = jobModel.messageCount;
            
            if (jobCount > 0) {
                [contents addObject:jobModel];
            }
        }
    }
    
    
    NSData *zanData = [[NSUserDefaults standardUserDefaults] objectForKey:@"zanData"];
    
    if (zanData) {
        MessageCountModel *zanModel = [NSKeyedUnarchiver unarchiveObjectWithData:zanData];
        
        if (zanModel) {
            NSInteger zanCount = zanModel.messageCount;
            
            if (zanCount > 0) {
                [contents addObject:zanModel];
            }
        }
    }
    
    return contents;
}



- (NSInteger)getMessageAllCount
{
    NSInteger allCount = 0;
    
    NSData *messageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"messageData"];
    
    if (messageData) {
        MessageCountModel *messageModel = [NSKeyedUnarchiver unarchiveObjectWithData:messageData];
        
        if (messageModel) {
            NSInteger messageCount = messageModel.messageCount;
            //数量大于1
            allCount += messageCount;
        }
    }
    
    
    
    NSData *commentData = [[NSUserDefaults standardUserDefaults] objectForKey:@"commentData"];
    
    if (commentData) {
        MessageCountModel *commentModel = [NSKeyedUnarchiver unarchiveObjectWithData:commentData];
        
        if (commentModel) {
            NSInteger commnetCount = commentModel.messageCount;
            
            allCount += commnetCount;
        }
        
    }
    
    
    NSData *jobData = [[NSUserDefaults standardUserDefaults] objectForKey:@"jobData"];
    
    if (jobData) {
        MessageCountModel *jobModel = [NSKeyedUnarchiver unarchiveObjectWithData:jobData];
        
        if (jobModel) {
            NSInteger jobCount = jobModel.messageCount;
            
            allCount += jobCount;
        }
    }
    
    
    NSData *zanData = [[NSUserDefaults standardUserDefaults] objectForKey:@"zanData"];
    
    if (zanData) {
        MessageCountModel *zanModel = [NSKeyedUnarchiver unarchiveObjectWithData:zanData];
        
        if (zanModel) {
            NSInteger zanCount = zanModel.messageCount;
            
            allCount += zanCount;
        }
    }
    
    
    return allCount;
}



- (void)clearMessageCount
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"messageData"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"commentData"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"jobData"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"zanData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (void)clearSiXinCount
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"messageData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



- (void)setVauleInChatController:(NSString *)vaule
{
    [[NSUserDefaults standardUserDefaults] setValue:vaule forKey:@"isInChatView"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)isInChatController
{
    NSString *isChat = [[NSUserDefaults standardUserDefaults] objectForKey:@"isInChatView"];
    
    if ([isChat isEqual:@"YES"]) {
        return YES;
    }
    
    return NO;
}

@end
