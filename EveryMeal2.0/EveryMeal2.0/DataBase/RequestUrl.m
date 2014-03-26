//
//  requestUrl.m
//  tranMessageWithNSNotificationCenter
//
//  Created by 雨亭梧桐雪 on 14-3-20.
//  Copyright (c) 2014年 龙猫工作室. All rights reserved.
//

#import "RequestUrl.h"

@interface RequestUrl ()
{
    NSString * newPPJJ;
}
@property (nonatomic, retain) NSDictionary * resultOfDownLoad;
@property (nonatomic, copy) NSString * NotificationName;//NSString都要写成copy
@property (nonatomic, retain) NSMutableData * receiveData;

@end

@implementation RequestUrl

- (void)dealloc
{
    [_NotificationName release];
    [_receiveData release];
    [_resultOfDownLoad release];
    [super dealloc];
}

- (BOOL)creatURLRequestWithURLString:(NSString *)urlString bodyString:(NSString *)bodyString NotificationName:(NSString *)NotificationName
{
    self.NotificationName = NotificationName;
    NSURL * url = [NSURL URLWithString:urlString];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSData * bodyData = [bodyString dataUsingEncoding:NSUTF8StringEncoding];

    [urlRequest setHTTPBody:bodyData];
    [urlRequest setHTTPMethod:@"POST"];
    return [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

- (NSMutableData *)receiveData{
    if (_receiveData == nil) {
        _receiveData = [[NSMutableData alloc]init];
    }
    return _receiveData;
}

#pragma mark - 👿 NSURLSessionDataDelegate 𝕯𝔢𝔩𝔢𝔤𝔞𝔱𝔢 𝕸𝔢𝔱𝔨𝔬𝔡 😈 -
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response//*
{
    //一旦建立链接的服务器正确响应了, 会由委托方connection对象, 回调这个协议方法, 告诉委托方, 服务器正确响应, 建立链接成功
    NSLog(@"🐷%s", __FUNCTION__);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data//*
{
    NSLog(@"🐨%s", __FUNCTION__);
    //建立链接成功之后, 就开始进行数据传输,传输的数据是分多个片段传输的.所以该协议方法会被多次调用, 直到数据传输完成
    [self.receiveData appendData:data];//增加data
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection//*
{
    NSLog(@"🐛%s", __FUNCTION__);
    //数据传输完成
    //把_receiveData解析之后的值用一个字典接收, 也就是_resultOfDownLoad
    [self setResultOfDownLoad:[NSJSONSerialization JSONObjectWithData:self.receiveData options:NSJSONReadingMutableContainers error:nil]];
    [[NSNotificationCenter defaultCenter] postNotificationName:_NotificationName object:self userInfo:_resultOfDownLoad];
    self.receiveData = nil;
}



@end
