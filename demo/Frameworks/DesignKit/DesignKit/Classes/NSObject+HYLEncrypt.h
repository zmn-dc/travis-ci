//
//  NSObject+HYLEncrypt.h
//  CsrfTokenSDK
//
//  Created by HH on 2021/4/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HYLEncrypt)

/** csrfToken的获取*/
- (NSString *)encrypt_csrfTokenWithMobile:(NSString *)mobile;

/** 当前时间戳*/
- (NSString *)xm_timestamp;

/** 时间戳(10位)*/
- (NSString *)xm_stringTimeIntervalWithDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
