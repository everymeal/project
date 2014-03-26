//
//  DateInfo.h
//  EveryMeal
//
//  Created by apple on 14-3-13.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

@interface DateInfo : BaseModel

@property(nonatomic,retain)UserInfo* releaseUser;//约饭发布者
@property(nonatomic,retain)UserInfo* joinUser;//应邀人
@property(nonatomic,retain)NSDate *dateTime;//约会时间
@property(nonatomic,retain)NSString *datePlace;//约会地点
@property(nonatomic,assign)DateCostMethod costMethod;//约会消费方式
@property(nonatomic,assign)DateTarget dateTarget;//邀请对象
@property(nonatomic,assign)int signUpNumbers;//已报名人数
@property(nonatomic,assign)DateState dateState;//约会状态，4种

- (NSString *)bodyString;

- (instancetype)initWithReleaseDateUserID:(UserInfo *)releaseUser
                   releaseUserAvaterImage:(UserInfo *)joinUser
                                 DateTime:(NSDate *)dateTime
                           DateCostMethod:(DateCostMethod)costMethod
                               DateTarget:(DateTarget)dateTarget
                            SignUpNumbers:(int)signUpNumbers
                                DateState:(DateState)dateState;

@end
