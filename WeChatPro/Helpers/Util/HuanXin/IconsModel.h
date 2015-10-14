//
//  IconsModel.h
//  YRJJApp
//
//  Created by panbin on 15/1/31.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IconsModel : NSObject

@property (nonatomic, strong) NSString *iconName;
@property (nonatomic, strong) NSString *iconTitle;

// 1 表示私信 2 表示评论 3 表示工作
@property (nonatomic, assign) NSInteger messageType;

@end
