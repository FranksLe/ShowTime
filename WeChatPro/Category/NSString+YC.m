//
//  NSString+YC.m
//  新浪微博
//
//  Created by cong on 14-9-10.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "NSString+YC.h"

@implementation NSString (YC)



#pragma mark -- 该方法只能截取该app随用数据源的服务器的返回值的错误信息截取
+ (NSString *)getErrorMessageFromCode:(NSString *)codeStr{
    NSString *str = @"NSLocalizedDescription";
    //NSString *sourceMsg = [failure description];
    NSRange range = [codeStr rangeOfString:str];
    NSString *showMsg = [codeStr substringFromIndex:range.location + range.length + 1];
    NSString *cutStr = NSLocalizedString(@"。", nil);
    NSArray *arr = [showMsg componentsSeparatedByString:cutStr];
    NSString *string = arr[0];
    return string;
}

-(NSString *)fileAppend:(NSString *)append
{
    //取得扩展名
    NSString *ext = [self pathExtension];

    //删除后面的扩展名
    NSString *imageName = [self stringByDeletingPathExtension];

    //在删除扩展名的imageName后面拼接上－568h@2x
    imageName = [imageName stringByAppendingString:append];

    //将前面取得的扩展名拼接到上面得到的imageName后面
    return [NSString stringWithFormat:@"%@.%@",imageName,ext];
}


+ (NSString *)transformDataBy:(NSString *)sourceDate{
    
    NSString *cutTStr = [sourceDate stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    NSString *getDate = [cutTStr componentsSeparatedByString:@"."][0];
   // NSLog(@"getDate:%@",getDate);
    //将动态时间转为NSDate对象
    NSDateFormatter *form = [[NSDateFormatter alloc]init];
    form.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    form.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSDate *date = [form dateFromString:getDate];
    
    //将date跟当前时间比较，生成合理的字符串
    //获得当前时间
    NSDate *now = [NSDate date];
    //获得发送动态时间和当前时间之间的时间间隔，单位为秒
    NSTimeInterval delta = [now timeIntervalSinceDate:date];
    if (delta < 60) {  //60秒之内
        return @"刚刚";
    }else
        if (delta < 60 * 60){
        return [NSString stringWithFormat:@"%.f分钟前",delta/60.0];
    }else if(delta < 60 * 60 *24){
        if (delta == 24) {
            return @"一天前";
        }else{
            return [NSString stringWithFormat:@"%.f小时前",delta/60/60];
        }
    }else{
        
        form.dateFormat = @"yyyy-MM-dd HH:mm";
        NSString * dateStr = [form stringFromDate:date];
        return dateStr;
    }
   
}


+ (NSString *)judgeTheTimeIsYestodayOrToday:(NSString *)sourceDate{
    
    NSString *cutTStr = [sourceDate stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    NSString *getDate = [cutTStr componentsSeparatedByString:@"."][0];
    // NSLog(@"getDate:%@",getDate);
    //将动态时间转为NSDate对象
    NSDateFormatter *form = [[NSDateFormatter alloc]init];
    form.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    form.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSDate *date = [form dateFromString:getDate];  //动态发送的时间
    
    NSDate* dat = [NSDate date];  //当前的系统时间
    NSTimeInterval now= [dat timeIntervalSince1970]*1;
    NSTimeInterval preTime = [date timeIntervalSince1970]*1;
    NSInteger today = now / (24*3600);
    NSInteger yestoday = preTime / (24*3600);
    NSInteger iDiff = today - yestoday;
    NSString *strDiff = nil;
    
    /*
     iDiff== 0今天
     iDiff== 1昨天
     iDiff== 2前天
     iDiff>= 3大前天
     */
    
    
    if(iDiff == 0) {
        strDiff= [NSString stringWithFormat:@"今天"];
        form.dateFormat = @"HH:mm";
        NSString * dateStr = [form stringFromDate:date];
        return dateStr;
    }else if (iDiff == 1) {
//        strDiff = [NSString stringWithFormat:@"昨天"];
//        form.dateFormat = @"HH:mm";
//        NSString * dateStr = [NSString stringWithFormat:@"昨天 %@",[form stringFromDate:date]];
        return @"昨天";
    }else{
        strDiff = [NSString stringWithFormat:@"前天"];
        form.dateFormat = @"yyyy/MM/dd HH:mm";
        NSString * dateStr = [form stringFromDate:date];
        return dateStr;
    }
}


/**
 *  返回生成好的时间字符串
 *
 */
- (NSString *)transformMessageDate{
    
//    NSLog(@"%@",self);
    
    NSString *cutTStr = [self stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    NSString *getDate = [cutTStr componentsSeparatedByString:@"Z"][0];
    // NSLog(@"getDate:%@",getDate);
    //将动态时间转为NSDate对象
    NSDateFormatter *form = [[NSDateFormatter alloc]init];
    form.dateFormat = @"yyyy-MM-dd HH:mm:ss";
//    form.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    //+8小时
    NSDate *date = [[form dateFromString:getDate] dateByAddingTimeInterval:8 * 60 * 60];
    getDate = [form stringFromDate:date];
    
    //将date跟当前时间比较，生成合理的字符串
    //获得当前时间
    NSDate *now = [NSDate date];
    NSString *nowDate = [form stringFromDate:now];
    
    //获得发送动态时间和当前时间之间的时间间隔，单位为秒
    NSTimeInterval delta = [now timeIntervalSinceDate:date];

    NSRange yearRange = NSMakeRange(0, 4);
    if ([[nowDate substringWithRange:yearRange] isEqualToString:[getDate substringWithRange:yearRange]]) {//同一年
        NSRange dayRange = NSMakeRange(6, 5);
        if ([[nowDate substringWithRange:dayRange] isEqualToString:[getDate substringWithRange:dayRange]]) {//同一天
            form.dateFormat = @"HH:mm";
            return [form stringFromDate:date];
        }else{//不是同一天
            
            if (delta > 60 * 60 * 24 * 2) {//前天、以及更久
                
                form.dateFormat = @"MM-dd HH:mm";
                return [form stringFromDate:date];
                
            }else{//昨天
            
                form.dateFormat = @"昨天 HH:mm";
                return [form stringFromDate:date];

            }
        }
    }else{//不是同一年
    
        form.dateFormat = @"yyyy-MM-dd HH:mm";
        return [form stringFromDate:date];
    }
    
}

+ (int)whatTheIOSVersion{
    int version = [[[UIDevice currentDevice]systemVersion] intValue];
    return version;
}


- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

/**
 *  判断当前语言环境
 */
+ (NSString*)getPreferredLanguage
{
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang;
    if (languages.count > 0){
        preferredLang = [languages objectAtIndex:0];
    }
//    NSLog(@"Preferred Language:%@", preferredLang);
    return preferredLang;
}
@end
