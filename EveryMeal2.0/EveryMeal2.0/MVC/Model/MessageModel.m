//
//  MessageModel.m
//  EveryMeal2.0
//
//  Created by  liwenhao on 14-3-24.
//  Copyright (c) 2014年 龙猫工作室. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel
- (instancetype) initWithSendUser:(NSString *)sendUser
                         SendTime:(NSDate *)sendTime
                   SendUserAvatar:(UIImage *)sendUserAvatar
                          Message:(NSString *)message{
    if (self = [super init]) {
        self.sendUser = sendUser;
        self.sendTime = sendTime;
        self.sendUserAvatar = sendUserAvatar;
        self.message = message;
    }
    return self;
}
- (instancetype)init{
    return [self initWithSendUser:@"" SendTime:nil SendUserAvatar:nil Message:@""];
}

- (NSString *)sendTimeString{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc]init]autorelease];
    [dateFormatter setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
    return [[[dateFormatter stringFromDate:self.sendTime]retain]autorelease];
}
@end
