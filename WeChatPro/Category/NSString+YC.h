//
//  NSString+YC.h
//  新浪微博
//
//  Created by cong on 14-9-10.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (YC)
+ (NSString *)getErrorMessageFromCode:(NSString *)codeStr;
-(NSString *)fileAppend:(NSString *)append;
+ (NSString *)transformDataBy:(NSString *)sourceDate;

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
/**
 *  返回生成好的时间字符串
 *
 */
- (NSString *)transformMessageDate;


+ (NSString *)judgeTheTimeIsYestodayOrToday:(NSString *)sourceDate;

/**
 *  判断当前语言环境
 */
+ (NSString*)getPreferredLanguage;

//查询当前系统版本
+ (int)whatTheIOSVersion;
@end
