//
//  requestUrl.h
//  tranMessageWithNSNotificationCenter
//
//  Created by 雨亭梧桐雪 on 14-3-20.
//  Copyright (c) 2014年 龙猫工作室. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestUrl : NSObject<NSURLSessionDataDelegate, NSURLConnectionDelegate>

- (BOOL)creatURLRequestWithURLString:(NSString *)urlString bodyString:(NSString *)bodyString NotificationName:(NSString *)NotificationName;

@end
