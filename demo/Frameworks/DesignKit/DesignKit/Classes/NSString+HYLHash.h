//
//  NSString+HYLHash.h
//  CsrfTokenSDK
//
//  Created by HH on 2021/4/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HYLHash)

#pragma mark - Hash
/// 返回结果：32长度(128位，16字节，16进制字符输出则为32字节长度)   终端命令：md5 -s "123"
@property (readonly) NSString *hyl_md5String;
/// 返回结果：40长度   终端命令：echo -n "123" | openssl sha -sha1
@property (readonly) NSString *hyl_sha1String;
/// 返回结果：56长度   终端命令：echo -n "123" | openssl sha -sha224
@property (readonly) NSString *hyl_sha224String;
/// 返回结果：64长度   终端命令：echo -n "123" | openssl sha -sha256
@property (readonly) NSString *hyl_sha256String;
/// 返回结果：96长度   终端命令：echo -n "123" | openssl sha -sha384
@property (readonly) NSString *hyl_sha384String;
/// 返回结果：128长度   终端命令：echo -n "123" | openssl sha -sha512
@property (readonly) NSString *hyl_sha512String;

#pragma mark - HMAC
/// 返回结果：32长度  终端命令：echo -n "123" | openssl dgst -md5 -hmac "123"
- (NSString *)hyl_hmacMD5StringWithKey:(NSString *)key;
/// 返回结果：40长度   echo -n "123" | openssl sha -sha1 -hmac "123"
- (NSString *)hyl_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hyl_hmacSHA224StringWithKey:(NSString *)key;
- (NSString *)hyl_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hyl_hmacSHA384StringWithKey:(NSString *)key;
- (NSString *)hyl_hmacSHA512StringWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
