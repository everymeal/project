//
//  PersonUserInfo.m
//  EveryMeal
//
//  Created by  liwenhao on 14-3-21.
//  Copyright (c) 2014年 TinyDream. All rights reserved.
//

#import "PersonUserInfo.h"

@implementation PersonUserInfo

- (id)initWithUserInfo:(UserInfo *)userInfo{
    if(self = [super initUserInfoWithuserID:userInfo.userID userAccount:userInfo.userAccount userPassword:userInfo.userPassword userOccupation:userInfo.userOccupation userIndividualitysignature:userInfo.userIndividualitysignature userAppearedPlace:userInfo.userAppearedPlace userAvatar:userInfo.userAvatar userGender:userInfo.userGender userAge:userInfo.userAge userConstellation:userInfo.userConstellation userIfSmoking:userInfo.userIfSmoking userIfDrinking:userInfo.userIfDrinking]){
        
    }
    return self;
}
@end
