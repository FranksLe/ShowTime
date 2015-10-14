//
//  MessageCountModel.m
//  YRJJApp
//
//  Created by panbin on 15/2/3.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import "MessageCountModel.h"

@implementation MessageCountModel

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.messageCount = [aDecoder decodeIntegerForKey:@"messageCount"];
        self.messageType = [aDecoder decodeIntegerForKey:@"messageType"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:_messageCount forKey:@"messageCount"];
    [aCoder encodeInteger:_messageType forKey:@"messageType"];
}




@end
