//
//  MessageModel.h
//  EveryMeal2.0
//
//  Created by  liwenhao on 14-3-24.
//  Copyright (c) 2014年 龙猫工作室. All rights reserved.
//

#import "BaseModel.h"

@interface MessageModel : BaseModel

@property (retain, nonatomic)  NSDate *sendTime;
@property (retain, nonatomic)  UIImage *sendUserAvatar;
@property (retain, nonatomic)  NSString *sendUser;
@property (retain, nonatomic)  NSString *message;

- (instancetype) initWithSendUser:(NSString *)sendUser
                         SendTime:(NSDate *)sendTime
                   SendUserAvatar:(UIImage *)sendUserAvatar
                          Message:(NSString *)message;
- (instancetype)init;

- (NSString *)sendTimeString;
@end
