//
//  DateInfo.m
//  EveryMeal
//
//  Created by apple on 14-3-13.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "DateInfo.h"

@implementation DateInfo
- (void)dealloc{
    RELEASE_SAFELY(_datePlace);
    RELEASE_SAFELY(_dateTime);
    [super dealloc];
}

- (NSString *)bodyString{
    NSMutableString *string = [NSMutableString string];
    [string appendFormat:@"%@=%ld&",@ToString(releaseDateUserID),_releaseUser.userID];
    [string appendFormat:@"%@=%ld&",@ToString(joinUserID),_joinUser.userID];
    [string appendFormat:@"%@='%@'&",@ToString(dateTime),_dateTime];
    [string appendFormat:@"%@=%@&",@ToString(datePlace),_datePlace];
    [string appendFormat:@"%@=%ld&",@ToString(costMethod),_costMethod];
    [string appendFormat:@"%@=%ld&",@ToString(dateTarget),_dateTarget];
    [string appendFormat:@"%@=%ld&",@ToString(signUpNumbers),_signUpNumbers];
    [string appendFormat:@"%@=%ld",@ToString(dateState),_dateState];
    
    
    return [[string retain]autorelease];
}

- (instancetype)initWithReleaseDateUserID:(UserInfo *)releaseUser
                   releaseUserAvaterImage:(UserInfo *)joinUser
                                 DateTime:(NSDate *)dateTime
                           DateCostMethod:(DateCostMethod)costMethod
                               DateTarget:(DateTarget)dateTarget
                            SignUpNumbers:(int)signUpNumbers
                                DateState:(DateState)dateState{
    
    if (self = [super init]) {
        self.releaseUser = releaseUser;
        self.joinUser = joinUser;
        self.dateTime = dateTime;
        self.costMethod = costMethod;
        self.dateTarget = dateTarget;
        self.signUpNumbers = signUpNumbers;
        self.dateState = dateState;
    }
    return self;
}

@end
