//
//  NSObject+HYLEncrypt.m
//  CsrfTokenSDK
//
//  Created by HH on 2021/4/9.
//

#import "NSObject+HYLEncrypt.h"

#import "NSString+HYLHash.h"

#define HmacKey @"Y1MBbjtNw4ibPHfgR8zxew9HIMUwJv03"
#define CsrfKey @"25d634bc1b39e11129fbe37a8cff7e18"

@implementation NSObject (HYLEncrypt)

/** csrfToken的获取*/
- (NSString *)encrypt_csrfTokenWithMobile:(NSString *)mobile0 {
//    csrfToken = hash_hmac('sha512', md5($csrfKey . $timestamp . $mobile), $hmacKey);
    NSString *csrfKey = CsrfKey;
    NSString *timestamp = [self xm_timestamp];
    NSString *mobile = safeNullStr(mobile0);
    NSString *hmacKey = HmacKey;
    
    NSString *md5PlainText = [NSString stringWithFormat:@"%@%@%@", csrfKey, timestamp, mobile];
    NSString *md5CipherText = [md5PlainText hyl_md5String];
    
    NSString *sha512CipherText = [md5CipherText hyl_hmacSHA512StringWithKey:hmacKey];
    
    return sha512CipherText;
}

/** 当前时间戳*/
- (NSString *)xm_timestamp {
    NSString *timestamp = [self xm_stringTimeIntervalWithDate:[NSDate date]];
    NSLog(@"timestamp = %@", timestamp);
    return timestamp;
}

/** 时间戳(10位)*/
- (NSString *)xm_stringTimeIntervalWithDate:(NSDate *)date {
    if (!date) return @"";
    NSTimeInterval interval = [date timeIntervalSince1970];
    NSString *timestamp = [NSString stringWithFormat:@"%0.0lf", interval];
    return timestamp;
}

///判断字符串是否为空
static inline BOOL isStringEmpty(NSString *value) {
    BOOL result = NO;
    if (!value || [value isKindOfClass:[NSNull class]] ||[value isEqualToString:@"null"] ||[value isEqualToString:@"(null)"] ||[value isEqualToString:@"nil"] ||[value isEqualToString:@"<null>"]) {
        result = YES;
    } else {
        NSString *trimedString = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([value isKindOfClass:[NSString class]] && [trimedString length] == 0) {
            result = YES;
        }
    }
    return result;
}

///判断字符串是否为空
static inline NSString* safeNullStr(NSString *value) {
    if(isStringEmpty(value))
    {
        return @"";
    } else{
        return value;
    }
}

@end
